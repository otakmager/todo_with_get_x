import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/todo_editor_controller.dart';

class TodoEditorView extends GetView<TodoEditorController> {
  const TodoEditorView({super.key});
  @override
  Widget build(BuildContext context) {
    final type = Get.arguments['type'] ?? 'add';
    final formKey = GlobalKey<FormState>();
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

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
                controller: titleController,
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
                controller: descriptionController,
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
                    Get.back();
                    if (type == 'add') {
                      Get.snackbar('Success', 'To Do added successfully',
                          duration: const Duration(seconds: 5));
                    } else {
                      Get.snackbar('Success', 'To Do update successfully',
                          duration: const Duration(seconds: 5));
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
