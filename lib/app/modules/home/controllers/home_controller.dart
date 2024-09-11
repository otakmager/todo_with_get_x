import 'package:get/get.dart';

import '../../../data/model/custom_exception.dart';
import '../../../data/model/failure_model.dart';
import '../../../data/model/todo.dart';
import '../../../data/model/ui_state.dart';
import '../../../data/remote/api_service.dart';
import '../../../widgets/dialog/dialog_error.dart';
import '../../../widgets/dialog/dialog_loading.dart';

class HomeController extends GetxController {
  final apiService = ApiService();
  var uiState = Rxn<UiState>(null);
  var errorInfo = Rxn<FailureModel>();
  RxList<ToDo?> list = <ToDo>[].obs;

  @override
  void onInit() {
    super.onInit();
    getToDo();
  }

  void setUiState(UiState? state) => uiState.value = state;

  void showErrorDialog() {
    Get.dialog(
        dialogError(errorInfo.value?.statusCode, errorInfo.value?.message));
  }

  Future<void> getToDo() async {
    setUiState(UiState.loading);

    try {
      list.value = await apiService.getToDo();
      setUiState(UiState.success);
    } on CustomException catch (e) {
      errorInfo.value = FailureModel(e.statusCode, e.message);
      setUiState(UiState.error);
    } catch (e) {
      errorInfo.value = FailureModel(-1, e.toString());
      setUiState(UiState.error);
    }
  }
}
