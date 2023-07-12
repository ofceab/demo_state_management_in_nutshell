import 'package:bloc_intro/bloc/todo_bloc.dart';
import 'package:bloc_intro/bloc/todo_event.dart';
import 'package:bloc_intro/bloc/todo_state.dart';
import 'package:bloc_intro/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoListView extends StatelessWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(builder: (_, state) {
      if (state is TodoAddedState ||
          state is TodoInitialState ||
          state is TodoRemovedState) {
        final todos = BlocProvider.of<TodoBloc>(context).todos;
        return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) => Container(
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(vertical: 7),
                  child: ListTile(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const SecondScreen())),
                    title: Text(todos[index].name),
                    trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => BlocProvider.of<TodoBloc>(context)
                            .add(RemoveTodoEvent(todos[index].id))),
                  ),
                ));
      } else if (state is TodoLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        final message = (state as TodoFailureState).message;
        return Center(
          child: Text('Erreur: $message'),
        );
      }
    });
  }
}
