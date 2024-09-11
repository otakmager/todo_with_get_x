import 'package:get/get.dart';

import '../../../data/model/custom_exception.dart';
import '../../../data/model/failure_model.dart';
import '../../../data/model/todo.dart';
import '../../../data/model/ui_state.dart';
import '../../../data/remote/api_service.dart';
import '../../../widgets/dialog/dialog_error.dart';
import '../../../widgets/dialog/dialog_loading.dart';

class TodoEditorController extends GetxController {
  final apiService = ApiService();
  var uiStateGet = Rxn<UiState>();
  var uiStateCreate = Rxn<UiState>();
  var uiStateUpdate = Rxn<UiState>();
  var errorInfo = Rxn<FailureModel>();
  var todo = Rxn<ToDo>();
  var titleText = ''.obs;
  var descText = ''.obs;

  void setUiStateGet(UiState? state) => uiStateGet.value = state;
  void setUiStateCreate(UiState? state) => uiStateCreate.value = state;
  void setUiStateUpdate(UiState? state) => uiStateUpdate.value = state;

  void showErrorDialog() {
    Get.dialog(
        dialogError(errorInfo.value?.statusCode, errorInfo.value?.message));
  }

  void showLoadingDialog() {
    Get.dialog(barrierDismissible: false, dialogLoading());
  }

  void setTitleText(String? text) {
    titleText.value = text ?? '';
  }

  void setDescText(String? text) {
    descText.value = text ?? '';
  }

  Future<void> getToDobyId(String id) async {
    setUiStateGet(UiState.loading);
    showLoadingDialog();

    try {
      Get.back();
      todo.value = await apiService.getToDoById(id);
      setTitleText(todo.value?.title);
      setDescText(todo.value?.description);
      setUiStateGet(UiState.success);
    } on CustomException catch (e) {
      errorInfo.value = FailureModel(e.statusCode, e.message);
      setUiStateGet(UiState.error);
    } catch (e) {
      errorInfo.value = FailureModel(-1, e.toString());
      setUiStateGet(UiState.error);
    }
  }

  Future<void> createToDo() async {
    setUiStateCreate(UiState.loading);
    showLoadingDialog();
    final body = {
      "title": titleText.value,
      "description": descText.value,
      "is_completed": false,
    };

    try {
      Get.back();
      final success = await apiService.createToDo(body);
      if (success) {
        setUiStateCreate(UiState.success);
        Get.back(); // back to list
        Get.snackbar('Success', 'To Do added successfully',
            duration: const Duration(seconds: 5));
      } else {
        errorInfo.value = FailureModel(-1, 'Failed to create');
        setUiStateCreate(UiState.error);
        showErrorDialog();
      }
    } on CustomException catch (e) {
      errorInfo.value = FailureModel(e.statusCode, e.message);
      setUiStateCreate(UiState.error);
    } catch (e) {
      errorInfo.value = FailureModel(-1, e.toString());
      setUiStateCreate(UiState.error);
    }
  }

  Future<void> updateToDo() async {
    setUiStateUpdate(UiState.loading);
    showLoadingDialog();
    final body = {
      "title": titleText.value,
      "description": descText.value,
      "is_completed": false,
    };

    try {
      Get.back();
      final success = await apiService.updateToDo(todo.value?.id ?? '', body);
      if (success) {
        setUiStateUpdate(UiState.success);
        Get.back(); // back to list
        Get.snackbar('Success', 'To Do update successfully',
            duration: const Duration(seconds: 5));
      } else {
        errorInfo.value = FailureModel(-1, 'Failed to update');
        setUiStateUpdate(UiState.error);
        showErrorDialog();
      }
    } on CustomException catch (e) {
      errorInfo.value = FailureModel(e.statusCode, e.message);
      setUiStateUpdate(UiState.error);
    } catch (e) {
      errorInfo.value = FailureModel(-1, e.toString());
      setUiStateUpdate(UiState.error);
    }
  }
}
