import 'package:bloc_intro/bloc/todo_event.dart';
import 'package:bloc_intro/bloc/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../todo.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  TodoBloc() : super(TodoInitialState()) {
    _mapEventToState();
  }

  void _mapEventToState() {
    on<AddTodoEvent>((AddTodoEvent event, Emitter emit) {
      emit(TodoLoadingState());
      _todos = [..._todos, event.todo];
      emit(TodoAddedState());
    });

    on<RemoveTodoEvent>((RemoveTodoEvent event, Emitter emit) {
      emit(TodoLoadingState());
      try {
        final deletedTodo =
            _todos.firstWhere((todo) => todo.id == event.todoId);
        _todos = _todos.where((todo) => todo.id != event.todoId).toList();
        emit(TodoRemovedState(deletedTodo));
      } catch (e) {
        emit(TodoFailureState(e.toString()));
      }
    });
  }
}
