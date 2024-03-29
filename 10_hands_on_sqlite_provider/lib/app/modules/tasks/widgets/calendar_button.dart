import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/ui/theme_extension.dart';
import '../create_task_controller.dart';

class CalendarButton extends StatelessWidget {
  const CalendarButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<CreateTaskController>(context);
    final hasSelectedDate = controller.selectedDate != null;

    return InkWell(
      onTap: () async {
        final lastDate = DateTime.now().add(const Duration(days: 365));
        final controller = context.read<CreateTaskController>();

        final DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: lastDate,
        );

        if (pickedDate != null) {
          controller.setSelectedDate(pickedDate);
        }
      },
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.calendar_today,
              color: hasSelectedDate ? context.primaryColor : Colors.grey,
            ),
            const SizedBox(width: 10),
            Text(
              hasSelectedDate
                  ? '${controller.selectedDate?.day}/${controller.selectedDate?.month}/${controller.selectedDate?.year}'
                  : 'Select a date'.toUpperCase(),
              style: TextStyle(
                color: hasSelectedDate ? context.primaryColor : Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
