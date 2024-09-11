import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/todo_editor_controller.dart';

class TodoEditorView extends GetView<TodoEditorController> {
  const TodoEditorView({super.key});

  @override
  Widget build(BuildContext context) {
    final type = Get.arguments['type'] ?? 'add';
    final id = Get.arguments['id'] ?? '';
    final formKey = GlobalKey<FormState>();

    if (id != null || id.isNotEmpty()) {
      controller.getToDobyId(id);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text((type == 'add') ? 'Add To Do' : 'Edit To Do'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller:
                    TextEditingController(text: controller.titleText.value),
                onChanged: (value) {
                  controller.setTitleText(value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter title';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
              ),
              TextFormField(
                controller:
                    TextEditingController(text: controller.descText.value),
                onChanged: (value) {
                  controller.setDescText(value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter description';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (type == 'add') {
                      controller.createToDo();
                    } else {
                      controller.updateToDo();
                    }
                  }
                },
                child: Text((type == 'add') ? 'Add' : 'Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
