import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/ui_state.dart';
import '../controllers/home_controller.dart';
import '../widgets/top5_todo.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My To Do'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('Top 5 To Do',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(height: 8),
            Obx(() {
              if (controller.uiState.value == UiState.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (controller.uiState.value == UiState.error) {
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
              } else if (controller.uiState.value == UiState.success) {
                return Top5ToDo(list: controller.list);
              } else {
                return const Center(child: Text('No Data'));
              }
            }),
            const SizedBox(height: 24),
            Center(
                child: ElevatedButton(
                    onPressed: () => Get.toNamed('/list'),
                    child: const Text('View All'))),
          ],
        ),
      ),
    );
  }
}
