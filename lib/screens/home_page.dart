import 'package:flutter/material.dart';
import 'package:todo_app/databases/functions/db_functions.dart';
import 'package:todo_app/screens/widgets/input_widget.dart';
import 'package:todo_app/screens/widgets/todo_list_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TodoDatabase().refreshui();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Todo"),
        ),
        body: const Column(
          children: [
            TodoAddWidget(),
            TodoListWidget(),
          ],
        ),
      ),
    );
  }
}
