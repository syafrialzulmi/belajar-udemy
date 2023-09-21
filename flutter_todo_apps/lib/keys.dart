import 'package:flutter/material.dart';
import 'package:flutter_todo_apps/check_todo_item.dart';
// import 'package:flutter_todo_apps/todo_item.dart';

class Todo {
  const Todo(this.text, this.priority);
  final String text;
  final Priority priority;
}

class Keys extends StatefulWidget {
  const Keys({super.key});

  @override
  State<Keys> createState() => _KeysState();
}

class _KeysState extends State<Keys> {
  var _order = 'asc';
  final _todo = const [
    Todo("Pergi ke pasar", Priority.casual),
    Todo("Makan bersama", Priority.low),
    Todo("Ikut pergi", Priority.urgent),
    Todo("Bertemu mantan", Priority.normal),
  ];

  List<Todo> get _orderedTodos {
    final sortedTodo = List.of(_todo);

    sortedTodo.sort(
      (a, b) {
        final bComesAfterA = a.text.compareTo(b.text);
        return _order == 'asc' ? bComesAfterA : -bComesAfterA;
      },
    );

    return sortedTodo;
  }

  void _changeOrder() {
    setState(() {
      _order = _order == 'asc' ? 'desc' : 'asc';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Todo Apps"),
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: TextButton.icon(
              onPressed: _changeOrder,
              icon: Icon(
                  _order == 'asc' ? Icons.arrow_downward : Icons.arrow_upward),
              label:
                  Text('Sort ${_order == 'asc' ? 'Descending' : 'Ascending'}'),
            ),
          ),
          Expanded(
              child: Column(
            children: [
              for (final todo in _orderedTodos)
                // TodoItem(
                //   todo.text,
                //   todo.priority,
                // ),
                CheckTodoItem(
                  // key: ValueKey(todo.text),
                  key: ObjectKey(todo),
                  todo.text,
                  todo.priority,
                )
            ],
          )),
        ],
      ),
    );
  }
}
