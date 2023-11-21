import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(10),
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
        child: IntrinsicHeight(
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
            title: const Text(
              'Buy milk',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: const Text(
              '2 liters of milk',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
