import 'package:flutter/material.dart';

import '../../../core/ui/theme_extension.dart';
import 'todo_card_filter.dart';

class HomeFilters extends StatefulWidget {
  const HomeFilters({super.key});

  @override
  State<HomeFilters> createState() => _HomeFiltersState();
}

class _HomeFiltersState extends State<HomeFilters> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          'Filters'.toUpperCase(),
          style: context.titleStyle,
        ),
        const SizedBox(height: 20),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              TodoCardFilter(),
              TodoCardFilter(),
              TodoCardFilter(),
              TodoCardFilter(),
            ],
          ),
        )
      ],
    );
  }
}
