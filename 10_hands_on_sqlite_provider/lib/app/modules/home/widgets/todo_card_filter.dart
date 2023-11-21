import 'package:flutter/material.dart';

import '../../../core/ui/theme_extension.dart';

class TodoCardFilter extends StatelessWidget {
  const TodoCardFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(10),
      constraints: const BoxConstraints(
        maxHeight: 120,
        maxWidth: 140,
      ),
      decoration: BoxDecoration(
        color: context.primaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '10 tasks'.toUpperCase(),
            style: context.titleStyle.copyWith(
              fontSize: 10,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Today',
            style: context.titleStyle.copyWith(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const LinearProgressIndicator(
            value: 0.5,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
