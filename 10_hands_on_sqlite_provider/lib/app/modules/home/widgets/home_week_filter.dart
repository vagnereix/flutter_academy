import 'package:flutter/material.dart';

import '../../../core/ui/theme_extension.dart';
import 'date_picker_custom.dart';

class HomeWeekFilter extends StatelessWidget {
  const HomeWeekFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
            DateTime.now(),
            initialSelectedDate: DateTime.now(),
            monthTextStyle: const TextStyle(fontSize: 10),
            dayTextStyle: const TextStyle(fontSize: 10),
            dateTextStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            selectionColor: context.primaryColor,
            selectedTextColor: Colors.white,
            daysCount: 7,
            onDateChange: (date) {
              debugPrint('$date');
            },

            /** possíveis contribuições à lib */
            padding: const EdgeInsets.symmetric(horizontal: 20),
          ),
        )
      ],
    );
  }
}
