import 'package:flutter/material.dart';

enum Priority { casual, urgent, normal, low }

class CheckTodoItem extends StatefulWidget {
  const CheckTodoItem(this.text, this.priority, {super.key});

  final String text;
  final Priority priority;

  @override
  State<CheckTodoItem> createState() => _CheckTodoItemState();
}

class _CheckTodoItemState extends State<CheckTodoItem> {
  var _done = false;

  void _setDone(bool? isChecked) {
    setState(() {
      _done = isChecked ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var icon = Icons.one_k;
    if (widget.priority == Priority.casual) {
      icon = Icons.two_k;
    }

    if (widget.priority == Priority.normal) {
      icon = Icons.three_k;
    }

    if (widget.priority == Priority.urgent) {
      icon = Icons.four_k;
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Checkbox(
            value: _done,
            onChanged: _setDone,
          ),
          const SizedBox(
            width: 10,
          ),
          Icon(icon),
          const SizedBox(
            width: 10,
          ),
          Text(widget.text),
        ],
      ),
    );
  }
}
