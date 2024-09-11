import 'dart:convert';

import 'package:dio/dio.dart';

import '../model/custom_exception.dart';
import '../model/failure_model.dart';
import '../model/todo.dart';

class ApiService {
  final Dio dio = Dio();
  static const baseUrl = "https://api.nstack.in/v1";

  Future<List<ToDo?>> getToDo() async {
    try {
      final response = await dio.get('$baseUrl/todos');
      if (response.statusCode == 200) {
        final data = ToDoData.fromJson(response.data);
        return data.items;
      } else {
        throw CustomException(
            FailureModel(response.statusCode, response.statusMessage));
      }
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw CustomException(FailureModel(-1, e.toString()));
    }
  }

  Future<ToDo?> getToDoById(String id) async {
    try {
      final response = await dio.get('$baseUrl/todos/$id');
      if (response.statusCode == 200) {
        final data = ToDo.fromJson(response.data);
        return data;
      } else {
        throw CustomException(
            FailureModel(response.statusCode, response.statusMessage));
      }
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw CustomException(FailureModel(-1, e.toString()));
    }
  }

  Future<bool> createToDo(Map body) async {
    try {
      final response = await dio.post('$baseUrl/todos',
          data: jsonEncode(body),
          options: Options(headers: {
            'content-type': 'application/json',
          }));
      if (response.statusCode == 201) {
        return true;
      } else {
        throw CustomException(
            FailureModel(response.statusCode, response.statusMessage));
      }
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw CustomException(FailureModel(-1, e.toString()));
    }
  }

  Future<bool> updateToDo(String id, Map body) async {
    try {
      final response = await dio.put('$baseUrl/todos/$id',
          data: jsonEncode(body),
          options: Options(headers: {
            'content-type': 'application/json',
          }));
      if (response.statusCode == 200) {
        return true;
      } else {
        throw CustomException(
            FailureModel(response.statusCode, response.statusMessage));
      }
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw CustomException(FailureModel(-1, e.toString()));
    }
  }

  Future<bool> deleteToDo(String id) async {
    try {
      final response = await dio.delete('$baseUrl/todos/$id');
      if (response.statusCode == 200) {
        return true;
      } else {
        throw CustomException(
            FailureModel(response.statusCode, response.statusMessage));
      }
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw CustomException(FailureModel(-1, e.toString()));
    }
  }

  FailureModel _handleDioError(DioException e) {
    if (e.type == DioExceptionType.unknown) {
      return FailureModel(-1, "No internet connection");
    } else if (e.type == DioExceptionType.badCertificate) {
      return FailureModel(500, "Internal server error");
    } else if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      return FailureModel(408, "Request timeout");
    } else if (e.type == DioExceptionType.badResponse) {
      final statusCode = e.response?.statusCode;
      if (statusCode != null) {
        switch (statusCode) {
          case 400:
            throw CustomException(FailureModel(statusCode, "Bad request"));
          case 401:
            throw CustomException(FailureModel(statusCode, "Unauthorized"));
          case 403:
            throw CustomException(FailureModel(statusCode, "Forbidden"));
          case 404:
            throw CustomException(FailureModel(statusCode, "Not found"));
          case 500:
            throw CustomException(
                FailureModel(statusCode, "Internal server error"));
          default:
            throw CustomException(FailureModel(statusCode, "Unknown error"));
        }
      } else {
        throw CustomException(FailureModel(-1, "Unknown error"));
      }
    } else if (e.type == DioExceptionType.cancel) {
      return FailureModel(-1, "Request cancelled");
    } else {
      return FailureModel(-1, "Uknown error");
    }
  }
}
