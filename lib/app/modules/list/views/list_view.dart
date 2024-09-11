import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/model/todo.dart';
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
          Get.toNamed('/todo-editor', arguments: {'type': 'add'});
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
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return ToDoListTile(
                  index: index,
                  todo: ToDo(
                    id: "${index + 1}",
                    title: 'Title $index',
                    description: 'Description $index',
                    isCompleted: false,
                  ));
            },
          )),
    );
  }
}
