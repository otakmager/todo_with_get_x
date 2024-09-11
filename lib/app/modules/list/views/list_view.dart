import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/ui_state.dart';
import '../../../widgets/list_tile/todo.listtile.dart';
import '../controllers/list_controller.dart';

class ListToDoView extends GetView<ListController> {
  const ListToDoView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateAdd();
        },
        child: const Icon(Icons.add),
      ),
      body: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
            },
          ),
          child: Obx(() {
            if (controller.uiStateGet.value == UiState.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (controller.uiStateGet.value == UiState.error) {
              return Column(
                children: [
                  const Text(
                    'Error!',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                      onPressed: () {
                        controller.showErrorDialog();
                      },
                      child: const Text('Show Error')),
                  const SizedBox(height: 8),
                  ElevatedButton(
                      onPressed: () {
                        controller.getToDo();
                      },
                      child: const Text('Retry')),
                ],
              );
            } else if (controller.uiStateGet.value == UiState.success) {
              return ListView.builder(
                itemCount: controller.list.length,
                itemBuilder: (context, index) {
                  return ToDoListTile(
                    index: index,
                    todo: controller.list[index]!,
                    navigateEdit: () {
                      navigateEdit(controller.list[index]!.id);
                    },
                    deleteToDo: () {
                      controller.deleteToDo(controller.list[index]!.id);
                    },
                  );
                },
              );
            } else {
              return const Center(child: Text('No Data'));
            }
          })),
    );
  }

  Future<void> navigateAdd() async {
    await Get.toNamed('/todo-editor', arguments: {'type': 'add', 'id': ''});
    controller.getToDo();
  }

  Future<void> navigateEdit(String id) async {
    await Get.toNamed('/todo-editor', arguments: {'type': 'edit', 'id': id});
    controller.getToDo();
  }
}
