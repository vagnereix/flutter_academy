import 'package:flutter/material.dart';

import '../../../core/ui/theme_extension.dart';
import '../../../models/task_filter_enum.dart';
import '../../../models/total_tasks_model.dart';
import 'todo_card_filter.dart';

class HomeFilters extends StatelessWidget {
  const HomeFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Filters'.toUpperCase(),
            style: context.titleStyle,
          ),
        ),
        const SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 10,
            ),
            child: Row(
              children: [
                TodoCardFilter(
                  label: 'Today',
                  filter: TaskFilterEnum.today,
                  totalTasksModel: TotalTasksModel(
                    tasksCount: 10,
                    finishedTasksCount: 5,
                  ),
                ),
                TodoCardFilter(
                  label: 'Tomorrow',
                  filter: TaskFilterEnum.tomorrow,
                  totalTasksModel: TotalTasksModel(
                    tasksCount: 7,
                    finishedTasksCount: 2,
                  ),
                ),
                TodoCardFilter(
                  label: 'Week',
                  filter: TaskFilterEnum.week,
                  totalTasksModel: TotalTasksModel(
                    tasksCount: 17,
                    finishedTasksCount: 7,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
