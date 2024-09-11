import 'package:flutter/material.dart';

import '../../data/model/todo.dart';

class ToDoCard extends StatelessWidget {
  final ToDo todo;
  const ToDoCard({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(
            todo.title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          Text(todo.description,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: false,
              style: const TextStyle(fontSize: 11)),
        ],
      ),
    );
  }
}
