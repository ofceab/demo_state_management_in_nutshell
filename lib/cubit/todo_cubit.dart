import 'package:flutter_bloc/flutter_bloc.dart';

import '../todo.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit(super.initialState);

  void addTodo(Todo todo) {
    final newTodos = [...state, todo];
    emit(newTodos);
  }

  void removeTodo(int id) {
    final newTodos = state.where((todo) => todo.id != id).toList();
    emit(newTodos);
  }
}
