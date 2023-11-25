import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../models/task_model.dart';
import '../home_controller.dart';

class TaskWidget extends StatelessWidget {
  final TaskModel task;
  final DateFormat _format = DateFormat('dd/MM/yyyy');

  TaskWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(40),
              blurRadius: 10,
            ),
          ],
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            debugPrint('Task tapped');
          },
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            leading: Checkbox(
              value: task.finished,
              onChanged: (value) {
                context.read<HomeController>().toggleTaskStatus(task);
              },
            ),
            title: Text(
              task.description,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              _format.format(task.date),
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
