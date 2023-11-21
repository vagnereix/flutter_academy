import 'package:flutter/material.dart';

import 'create_task_controller.dart';

class CreateTaskPage extends StatelessWidget {
  final CreateTaskController _controller;

  const CreateTaskPage({super.key, required CreateTaskController controller})
      : _controller = controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create task'),
      ),
      body: Container(),
    );
  }
}
