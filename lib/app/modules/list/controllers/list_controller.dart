import 'package:get/get.dart';

import '../../../data/model/custom_exception.dart';
import '../../../data/model/failure_model.dart';
import '../../../data/model/todo.dart';
import '../../../data/model/ui_state.dart';
import '../../../data/remote/api_service.dart';
import '../../../widgets/dialog/dialog_error.dart';
import '../../../widgets/dialog/dialog_loading.dart';

class ListController extends GetxController {
  final apiService = ApiService();
  var uiStateGet = Rxn<UiState>();
  var uiStateDel = Rxn<UiState>();
  var errorInfo = Rxn<FailureModel>();
  RxList<ToDo?> list = <ToDo>[].obs;

  @override
  void onInit() {
    getToDo();
    super.onInit();
  }

  void setUiStateGet(UiState? state) => uiStateGet.value = state;
  void setUiStateDel(UiState? state) => uiStateDel.value = state;

  void showErrorDialog() {
    Get.dialog(
        dialogError(errorInfo.value?.statusCode, errorInfo.value?.message));
  }

  void showLoadingDialog() {
    Get.dialog(barrierDismissible: false, dialogLoading());
  }

  Future<void> getToDo() async {
    setUiStateGet(UiState.loading);

    try {
      list.value = await apiService.getToDo();
      setUiStateGet(UiState.success);
    } on CustomException catch (e) {
      errorInfo.value = FailureModel(e.statusCode, e.message);
      setUiStateGet(UiState.error);
    } catch (e) {
      errorInfo.value = FailureModel(-1, e.toString());
      setUiStateGet(UiState.error);
    }
  }

  Future<void> deleteToDo(String id) async {
    setUiStateDel(UiState.loading);
    showLoadingDialog();

    try {
      Get.back();
      final result = await apiService.deleteToDo(id);
      if (result) {
        setUiStateDel(UiState.success);
        list.removeWhere((element) => element?.id == id);
      } else {
        errorInfo.value = FailureModel(-1, 'Failed to delete');
        setUiStateDel(UiState.error);
        showErrorDialog();
      }
    } on CustomException catch (e) {
      errorInfo.value = FailureModel(e.statusCode, e.message);
      setUiStateDel(UiState.error);
      showErrorDialog();
    } catch (e) {
      errorInfo.value = FailureModel(-1, e.toString());
      Get.dialog(dialogError(-1, e.toString()));
      showErrorDialog();
    }
  }
}
