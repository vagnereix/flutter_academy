import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/ui/theme_extension.dart';
import '../../../models/task_filter_enum.dart';
import '../../../models/total_tasks_model.dart';
import '../home_controller.dart';
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
                  label: TaskFilterToday().description,
                  filter: TaskFilterToday(),
                  totalTasksModel:
                      context.select<HomeController, TotalTasksModel?>(
                          (controller) => controller.todayTotalTasks),
                ),
                TodoCardFilter(
                  label: TaskFilterTomorrow().description,
                  filter: TaskFilterTomorrow(),
                  totalTasksModel:
                      context.select<HomeController, TotalTasksModel?>(
                          (controller) => controller.tomorrowTotalTasks),
                ),
                TodoCardFilter(
                  label: TaskFilterWeek().description,
                  filter: TaskFilterWeek(),
                  totalTasksModel:
                      context.select<HomeController, TotalTasksModel?>(
                          (controller) => controller.weekTotalTasks),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
