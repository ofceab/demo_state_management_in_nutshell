import 'package:flutter/material.dart';

import 'list_view.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      backgroundColor: Colors.black,
      body: const TodoListView(),
    );
  }
}
