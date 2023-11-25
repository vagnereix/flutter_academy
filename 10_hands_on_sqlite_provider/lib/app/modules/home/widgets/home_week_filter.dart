import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/ui/theme_extension.dart';
import '../../../models/task_filter_enum.dart';
import '../home_controller.dart';
import 'date_picker_custom.dart';

class HomeWeekFilter extends StatelessWidget {
  const HomeWeekFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: context.select<HomeController, bool>(
        (controller) => controller.filterSelected is TaskFilterWeek,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Week days'.toUpperCase(),
              style: context.titleStyle,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 113,
            child: DatePickerCustom(
              context.select<HomeController, DateTime>(
                (controller) => controller.firstDayOfWeek ?? DateTime.now(),
              ),
              initialSelectedDate: context.select<HomeController, DateTime>(
                (controller) => controller.firstDayOfWeek ?? DateTime.now(),
              ),
              onDateChange: (date) {
                context.read<HomeController>().filterByDay(date);
              },
              monthTextStyle: const TextStyle(fontSize: 10),
              dayTextStyle: const TextStyle(fontSize: 10),
              dateTextStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              selectionColor: context.primaryColor,
              selectedTextColor: Colors.white,
              daysCount: 7,

              /** possíveis contribuições à lib */
              padding: const EdgeInsets.symmetric(horizontal: 20),
            ),
          )
        ],
      ),
    );
  }
}
