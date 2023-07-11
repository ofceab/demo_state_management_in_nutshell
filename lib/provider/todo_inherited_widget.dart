import 'package:bloc_intro/provider/todo_provider.dart';
import 'package:flutter/material.dart';

class TodoInheritedWidget extends InheritedWidget {
  final TodoProvider data;

  const TodoInheritedWidget({
    super.key,
    required this.data,
    required super.child,
  });

  static TodoInheritedWidget of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<TodoInheritedWidget>()!;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
