import 'package:bloc_intro/first_screen.dart';
import 'package:bloc_intro/provider/todo_inherited_widget.dart';
import 'package:bloc_intro/provider/todo_provider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return TodoInheritedWidget(
      data: TodoProvider([]),
      child: const MaterialApp(
        home: FirstScreen(),
      ),
    );
  }
}
