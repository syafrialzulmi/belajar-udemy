import 'package:flutter/material.dart';

enum Priority { casual, urgent, normal, low }

class TodoItem extends StatelessWidget {
  const TodoItem(this.text, this.priority, {super.key});

  final String text;
  final Priority priority;

  @override
  Widget build(BuildContext context) {
    var icon = Icons.one_k;
    if (priority == Priority.casual) {
      icon = Icons.two_k;
    }

    if (priority == Priority.normal) {
      icon = Icons.three_k;
    }

    if (priority == Priority.urgent) {
      icon = Icons.four_k;
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(
            width: 10,
          ),
          Text(text),
        ],
      ),
    );
  }
}
