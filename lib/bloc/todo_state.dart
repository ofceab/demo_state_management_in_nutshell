import '../todo.dart';

class TodoState {}

class TodoInitialState extends TodoState {}

class TodoLoadingState extends TodoState {}

class TodoFailureState extends TodoState {
  final String message;
  TodoFailureState(this.message);
}

class TodoAddedState extends TodoState {}

class TodoRemovedState extends TodoState {
  final Todo todo;
  TodoRemovedState(this.todo);
}
