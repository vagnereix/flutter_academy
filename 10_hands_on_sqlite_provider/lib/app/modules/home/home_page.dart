import 'package:flutter/material.dart';

import '../../core/ui/filter_icon.dart';
import '../tasks/tasks_module.dart';
import 'widgets/home_drawer.dart';
import 'widgets/home_filters.dart';
import 'widgets/home_header.dart';
import 'widgets/home_tasks.dart';
import 'widgets/home_week_filter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _gotToCreateTask(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => TasksModule().getPage('/task/create', context),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.teal.shade200),
          actions: [
            PopupMenuButton(
              icon: const Icon(
                FilterIcon.filter,
                size: 20,
              ),
              elevation: 1,
              itemBuilder: (_) {
                return [
                  PopupMenuItem<bool>(
                    child: TextButton(
                      child: const Text('Completed tasks'),
                      onPressed: () => {},
                    ),
                  ),
                ];
              },
            ),
          ],
        ),
        drawer: const HomeDrawer(),
        body: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth,
              ),
              child: Container(
                /** remover e realocar espaçamentos */
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: const IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HomeHeader(),
                      HomeFilters(),
                      HomeWeekFilter(),
                      HomeTasks(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _gotToCreateTask(context),
          child: const Icon(Icons.add),
        ));
  }
}
