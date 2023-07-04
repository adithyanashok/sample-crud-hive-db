import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/databases/models/TodoModel.dart';

ValueNotifier<List<TodoModel>> todosNotifier = ValueNotifier([]);

abstract class TodoFunctions {
  Future<void> addTodo(TodoModel todo);

  Future<List<TodoModel>> getAllTodo();

  Future<void> deleteTodo(id);
}

class TodoDatabase implements TodoFunctions {
  // Add todo function
  @override
  Future<void> addTodo(TodoModel value) async {
    final _db = await Hive.openBox<TodoModel>('todo-db');
    final id = value.id;
    await _db.put(id, value);

    refreshui();
  }

  @override
  Future<List<TodoModel>> getAllTodo() async {
    final db = await Hive.openBox<TodoModel>('todo-db');
    return db.values.toList();
  }

  Future<void> refreshui() async {
    final db = await getAllTodo();
    todosNotifier.value.clear();
    todosNotifier.value.addAll(db.reversed);
    todosNotifier.notifyListeners();
  }

  @override
  Future<void> deleteTodo(id) async {
    final db = await Hive.openBox<TodoModel>('todo-db');
    await db.delete(id);
    refreshui();
  }
}
