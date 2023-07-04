import 'package:flutter/material.dart';
import 'package:todo_app/databases/functions/db_functions.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ValueListenableBuilder(
        valueListenable: todosNotifier,
        builder: (context, value, child) {
          return ListView.separated(
            padding: const EdgeInsets.all(10),
            itemBuilder: (BuildContext context, int index) {
              final _todos = value[index];
              print(_todos);
              return Card(
                elevation: 1,
                child: ListTile(
                  title: Text(
                    _todos.todo ?? "Empty",
                    style: TextStyle(
                        decoration: _todos.isChecked == true
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        TodoDatabase().deleteTodo(_todos.id);
                      },
                      icon: const Icon(Icons.check)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: 10),
            itemCount: value.length,
          );
        },
      ),
    );
  }
}
