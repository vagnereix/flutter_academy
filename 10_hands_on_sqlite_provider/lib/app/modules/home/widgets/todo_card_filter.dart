import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/ui/theme_extension.dart';
import '../../../models/task_filter_enum.dart';
import '../../../models/total_tasks_model.dart';
import '../home_controller.dart';

class TodoCardFilter extends StatelessWidget {
  final String label;
  final TaskFilterEnum filter;
  final TotalTasksModel? totalTasksModel;

  const TodoCardFilter({
    super.key,
    required this.label,
    required this.filter,
    this.totalTasksModel,
  });

  double _getFinishedPercentage() {
    final totalTasksCount = totalTasksModel?.tasksCount ?? 0;
    final finishedTasksCount = totalTasksModel?.finishedTasksCount ?? 0;

    if (totalTasksCount == 0) {
      return 0;
    }

    final percent = (finishedTasksCount * 100) / totalTasksCount;

    return percent / 100;
  }

  @override
  Widget build(BuildContext context) {
    final isSelected = filter ==
        context.select<HomeController, TaskFilterEnum>(
          (value) => value.filterSelected,
        );

    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(10),
      constraints: const BoxConstraints(
        maxHeight: 120,
        maxWidth: 140,
      ),
      decoration: BoxDecoration(
        color: isSelected ? context.primaryColor : Colors.white,
        border: isSelected ? null : Border.all(color: context.primaryColor),
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {
          context.read<HomeController>().setFilter(filter);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${totalTasksModel?.tasksCount} tasks'.toUpperCase(),
              style: context.titleStyle.copyWith(
                fontSize: 10,
                color: isSelected ? Colors.white : Colors.grey,
              ),
            ),
            Text(
              label,
              style: context.titleStyle.copyWith(
                fontSize: 20,
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0, end: _getFinishedPercentage()),
              duration: const Duration(milliseconds: 500),
              builder: (context, value, child) => LinearProgressIndicator(
                value: value,
                backgroundColor: isSelected ? null : Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(
                  isSelected ? Colors.white : context.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
