import 'package:bloc_intro/extension/extension_context.dart';
import 'package:bloc_intro/list_view.dart';
import 'package:bloc_intro/todo.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  late TextEditingController _editingController;

  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController();
  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Creer un todo',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.grey.shade200),
            child: TextField(
              controller: _editingController,
              onEditingComplete: _createTodo,
              style: const TextStyle(fontSize: 20),
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(25),
                  hintText: 'Entrer votre todo',
                  hintStyle: TextStyle(color: Colors.blue, fontSize: 18)),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Expanded(child: TodoListView())
        ],
      ),
    );
  }

  void _createTodo() {
    final todoProvider = context.get();
    final newTodo =
        Todo(_editingController.text, todoProvider.data.todos.length + 1);
    todoProvider.data.addTodo(newTodo);
    _editingController.clear();
  }
}
