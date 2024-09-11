import 'package:flutter/material.dart';

import '../../data/model/todo.dart';

class ToDoListTile extends StatefulWidget {
  final int index;
  final ToDo todo;
  const ToDoListTile({super.key, required this.index, required this.todo});

  @override
  State<ToDoListTile> createState() => _ToDoListTileState();
}

class _ToDoListTileState extends State<ToDoListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text('${widget.index + 1}'),
      ),
      title: Text(widget.todo.title),
      subtitle: Text(widget.todo.description),
      trailing: PopupMenuButton(
        itemBuilder: (context) => [
          const PopupMenuItem(
            value: 'edit',
            child: Text('Edit'),
          ),
          const PopupMenuItem(
            value: 'delete',
            child: Text('Delete'),
          ),
        ],
      ),
    );
  }
}
