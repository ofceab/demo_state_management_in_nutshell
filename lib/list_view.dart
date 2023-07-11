import 'package:bloc_intro/extension/extension_context.dart';
import 'package:bloc_intro/second_screen.dart';
import 'package:flutter/material.dart';

class TodoListView extends StatelessWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context) {
    final todoProvider = context.get();

    return StreamBuilder<bool>(
        stream: context.get().data.todoStream,
        builder: (_, __) {
          final todos = todoProvider.data.todos;
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
                          onPressed: () =>
                              todoProvider.data.removeTodo(todos[index].id)),
                    ),
                  ));
        });
  }
}
