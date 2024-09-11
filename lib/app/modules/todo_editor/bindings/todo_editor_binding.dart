import 'package:get/get.dart';

import '../controllers/todo_editor_controller.dart';

class TodoEditorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoEditorController>(
      () => TodoEditorController(),
    );
  }
}
