import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';

import '../../../core/ui/theme_extension.dart';

class HomeWeekFilter extends StatelessWidget {
  const HomeWeekFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          'Week days'.toUpperCase(),
          style: context.titleStyle,
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 113,
          child: DatePicker(
            DateTime.now(),
            initialSelectedDate: DateTime.now(),
            monthTextStyle: const TextStyle(fontSize: 10),
            dayTextStyle: const TextStyle(fontSize: 10),
            dateTextStyle: const TextStyle(fontSize: 20),
            selectionColor: context.primaryColor,
            selectedTextColor: Colors.white,
            daysCount: 7,
            onDateChange: (date) {
              debugPrint('$date');
            },
          ),
        )
      ],
    );
  }
}
