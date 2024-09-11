import 'package:flutter/material.dart';
import 'package:get/get.dart';

dialogError(statusCode, String? message) {
  return AlertDialog(
    title: const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Error'),
      ],
    ),
    content: SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Icon(Icons.error, color: Colors.red, size: 160),
        const SizedBox(height: 32),
        Text("Status code: ${statusCode ?? '-'}"),
        const SizedBox(height: 16),
        Text(message ?? "Uknowwn Error")
      ],
    )),
    actions: [
      TextButton(
        child: const Text('Ok'),
        onPressed: () {
          Get.back();
        },
      ),
    ],
  );
}
