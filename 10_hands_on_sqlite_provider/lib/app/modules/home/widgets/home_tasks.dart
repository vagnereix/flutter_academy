import 'package:flutter/material.dart';

import '../../../core/ui/theme_extension.dart';
import 'task_widget.dart';

class HomeTasks extends StatelessWidget {
  const HomeTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            'Today\'s tasks'.toUpperCase(),
            style: context.titleStyle,
          ),
          const SizedBox(height: 20),
          const TaskWidget(),
          const TaskWidget(),
          const TaskWidget(),
          const TaskWidget(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
