import 'package:bloc_intro/todo.dart';

class TodoEvent {}

class AddTodoEvent extends TodoEvent {
  final Todo todo;
  AddTodoEvent(this.todo);
}

class RemoveTodoEvent extends TodoEvent {
  final int todoId;
  RemoveTodoEvent(this.todoId);
}
