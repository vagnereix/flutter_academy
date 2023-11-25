import 'package:flutter/material.dart';

import '../../core/notifier/app_listener_notifier.dart';
import '../../core/ui/filter_icon.dart';
import '../../core/ui/theme_extension.dart';
import '../../models/task_filter_enum.dart';
import '../tasks/tasks_module.dart';
import 'home_controller.dart';
import 'widgets/home_drawer.dart';
import 'widgets/home_filters.dart';
import 'widgets/home_header.dart';
import 'widgets/home_tasks.dart';
import 'widgets/home_week_filter.dart';

class HomePage extends StatefulWidget {
  final HomeController _controller;

  const HomePage({super.key, required HomeController controller})
      : _controller = controller;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    AppListenerNotifier(changeNotifier: widget._controller).listen(
      context: context,
      successCallback: (notifier, listener) {},
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget._controller.loadTotalTasks();
      widget._controller.getTasksByFilter(TaskFilterToday());
    });
  }

  Future<void> _gotToCreateTask(BuildContext context) async {
    await Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return TasksModule().getPage('/task/create', context);
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          animation = CurvedAnimation(
            parent: animation,
            curve: Curves.easeInQuad,
          );

          return ScaleTransition(
            scale: animation,
            alignment: Alignment.bottomRight,
            child: child,
          );
        },
      ),
    );

    widget._controller.refreshPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: context.primaryColor),
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
                  value: true,
                  child: TextButton(
                    child: Text(
                      '${widget._controller.showFinishedTasks ? 'Hide' : 'Show'} completed tasks',
                    ),
                    onPressed: () {
                      widget._controller.toggleShowFinishedTasks();
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      drawer: const HomeDrawer(),
      body: const SingleChildScrollView(
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => _gotToCreateTask(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
