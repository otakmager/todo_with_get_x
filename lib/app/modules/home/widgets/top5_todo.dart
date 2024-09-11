import 'package:flutter/material.dart';

import '../../../data/model/todo.dart';
import '../../../widgets/card/todo.card.dart';

class Top5ToDo extends StatelessWidget {
  final List<ToDo?>? list;
  const Top5ToDo({super.key, this.list});

  @override
  Widget build(BuildContext context) {
    if (list != null && list!.isNotEmpty) {
      final top5List = list!.take(5).toList();
      return SizedBox(
        height: 80,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: top5List.length,
          itemBuilder: (context, index) {
            return ToDoCard(todo: top5List[index]!);
          },
        ),
      );
    } else {
      return Container(
        alignment: Alignment.center,
        child: const Text(
          "No Data Available!",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 10),
        ),
      );
    }
  }
}
