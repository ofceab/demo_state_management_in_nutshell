import 'dart:async';

import '../todo.dart';

// Sink  : add data
// Stream : ecoute les data

class TodoProvider {
  final StreamController<bool> _streamController;
  final List<Todo> todos;

  TodoProvider(this.todos) : _streamController = StreamController.broadcast();

  Stream<bool> get todoStream => _streamController.stream;

  void addTodo(Todo todo) {
    todos.add(todo);
    _streamController.add(true);
  }

  void removeTodo(int id) {
    todos.removeWhere((todo) => todo.id == id);
    _streamController.add(true);
  }
}
