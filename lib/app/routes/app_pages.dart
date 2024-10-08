import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/list/bindings/list_binding.dart';
import '../modules/list/views/list_view.dart';
import '../modules/todo_editor/bindings/todo_editor_binding.dart';
import '../modules/todo_editor/views/todo_editor_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LIST,
      page: () => const ListToDoView(),
      binding: ListBinding(),
    ),
    GetPage(
      name: _Paths.TODO_EDITOR,
      page: () => const TodoEditorView(),
      binding: TodoEditorBinding(),
    ),
  ];
}
