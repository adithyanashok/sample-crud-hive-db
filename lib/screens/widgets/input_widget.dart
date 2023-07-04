import 'package:flutter/material.dart';
import 'package:todo_app/databases/functions/db_functions.dart';
import 'package:todo_app/databases/models/TodoModel.dart';

final TextEditingController _controller = TextEditingController();

class TodoAddWidget extends StatelessWidget {
  const TodoAddWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: "Add new Task",
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                addToTodo();
              },
              child: const Text("Add"))
        ],
      ),
    );
  }
}

void addToTodo() async {
  final _todo = _controller.text;
  final id = DateTime.now().millisecondsSinceEpoch.toString();
  if (_todo.isEmpty) {
    return;
  }
  final _data = await TodoModel(todo: _todo, id: id);
  TodoDatabase().addTodo(_data);
}
