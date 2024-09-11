import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            const Top5ToDo(
              list: [],
            ),
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
