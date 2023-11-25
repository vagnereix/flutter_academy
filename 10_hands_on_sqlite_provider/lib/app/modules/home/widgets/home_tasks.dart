import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/ui/theme_extension.dart';
import '../home_controller.dart';
import 'task_widget.dart';

class HomeTasks extends StatelessWidget {
  const HomeTasks({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = context.watch<HomeController>().filteredTasks;
    final tasksWidgets = tasks
        ?.map(
          (task) => Dismissible(
            key: UniqueKey(),
            confirmDismiss: (direction) async {
              final isDeleteDirection =
                  direction == DismissDirection.endToStart;

              final controller = context.read<HomeController>();

              final bool confirm = await showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Are you sure?'),
                    content: Text(
                      'Do you want to ${isDeleteDirection ? 'delete' : 'finish'} ${task.description}?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text('Yes'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text('No'),
                      ),
                    ],
                  );
                },
              );

              if (confirm) {
                if (isDeleteDirection) {
                  await controller.deleteTask(task);
                } else {
                  await controller.toggleTaskStatus(task);
                }
              }

              return isDeleteDirection && confirm;
            },
            dismissThresholds: const {
              DismissDirection.startToEnd: 0.3,
              DismissDirection.endToStart: 0.3,
            },
            dragStartBehavior: DragStartBehavior.start,
            onDismissed: (direction) {
              if (direction == DismissDirection.endToStart) {
                context.read<HomeController>().deleteTask(task);
              } else {
                context.read<HomeController>().toggleTaskStatus(task);
              }
            },
            behavior: HitTestBehavior.opaque,
            background: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Icon(
                  Icons.delete,
                  color: context.primaryColor,
                ),
              ),
            ),
            child: TaskWidget(task: task),
          ),
        )
        .toList();

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Selector<HomeController, String>(
              selector: (_, controller) =>
                  controller.filterSelected.description,
              builder: (_, description, __) {
                return Text(
                  '$description\'s tasks'.toUpperCase(),
                  style: context.titleStyle,
                );
              },
            ),
            const SizedBox(height: 20),
            ...tasksWidgets ?? const [],
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
