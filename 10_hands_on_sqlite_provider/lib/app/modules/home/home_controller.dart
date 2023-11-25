import 'dart:async';

import '../../core/notifier/app_change_notifier.dart';
import '../../models/task_filter_enum.dart';
import '../../models/task_model.dart';
import '../../models/total_tasks_model.dart';
import '../../models/week_task_model.dart';
import '../../services/tasks/tasks_service.dart';

class HomeController extends AppChangeNotifier {
  final TasksService _tasksService;

  TaskFilter filterSelected = TaskFilterToday();

  TotalTasksModel? todayTotalTasks;
  TotalTasksModel? tomorrowTotalTasks;
  TotalTasksModel? weekTotalTasks;

  List<TaskModel>? allTasks;
  List<TaskModel>? filteredTasks;

  DateTime? firstDayOfWeek;
  DateTime? selectedDate;

  bool showFinishedTasks = false;

  HomeController({required TasksService tasksService})
      : _tasksService = tasksService;

  Future<void> loadTotalTasks() async {
    final [
      todayTasks as List<TaskModel>,
      tomorrowTasks as List<TaskModel>,
      weekTasks as WeekTaskModel,
    ] = await Future.wait([
      _tasksService.getTodayTasks(),
      _tasksService.getTomorrowTasks(),
      _tasksService.getWeekTasks(),
    ]);

    todayTotalTasks = TotalTasksModel(
      tasksCount: todayTasks.length,
      finishedTasksCount: todayTasks.where((task) => task.finished).length,
    );

    tomorrowTotalTasks = TotalTasksModel(
      tasksCount: tomorrowTasks.length,
      finishedTasksCount: tomorrowTasks.where((task) => task.finished).length,
    );

    weekTotalTasks = TotalTasksModel(
      tasksCount: weekTasks.tasks.length,
      finishedTasksCount: weekTasks.tasks.where((task) => task.finished).length,
    );

    notifyListeners();
  }

  Future<void> getTasksByFilter(TaskFilter filter) async {
    filterSelected = filter;
    setLoading(true);
    notifyListeners();

    final tasks = await _switchFromFilterAndExecute<List<TaskModel>>(
      filter: filter,
      callbackToday: () async {
        return await _tasksService.getTodayTasks();
      },
      callbackTomorrow: () async {
        return await _tasksService.getTomorrowTasks();
      },
      callbackWeek: () async {
        final weekTasks = await _tasksService.getWeekTasks();
        firstDayOfWeek = weekTasks.startDate;

        return weekTasks.tasks;
      },
    );

    allTasks = tasks;
    filteredTasks = tasks;

    if (filter is TaskFilterWeek) {
      if (selectedDate != null) {
        filterByDay(selectedDate!);
      } else if (firstDayOfWeek != null) {
        filterByDay(firstDayOfWeek!);
      }
    } else {
      selectedDate = null;
    }

    if (!showFinishedTasks) {
      filteredTasks = filteredTasks?.where((task) => !task.finished).toList();
    }

    setLoading(false);
    notifyListeners();
  }

  void filterByDay(DateTime date) {
    selectedDate = date;

    filteredTasks = allTasks?.where((task) {
      return task.date == date;
    }).toList();

    notifyListeners();
  }

  Future<void> refreshPage() async {
    await loadTotalTasks();
    await getTasksByFilter(filterSelected);

    notifyListeners();
  }

  Future<void> toggleTaskStatus(TaskModel task) async {
    showLoaderAndResetState();
    notifyListeners();

    await _tasksService.toggleTaskStatus(
      task.copyWith(finished: !task.finished),
    );

    filteredTasks = filteredTasks?.map((t) {
      if (t.id == task.id) {
        return t.copyWith(finished: !t.finished);
      }

      return t;
    }).toList();

    await _switchFromMultipleFiltersAndExecute(
      filters: [
        TaskFilterToday(),
        TaskFilterTomorrow(),
        TaskFilterWeek(),
      ],
      callbackToday: () async {
        todayTotalTasks = todayTotalTasks?.copyWith(
          finishedTasksCount:
              todayTotalTasks!.finishedTasksCount + (task.finished ? -1 : 1),
        );
      },
      callbackTomorrow: () async {
        tomorrowTotalTasks = tomorrowTotalTasks?.copyWith(
          finishedTasksCount:
              tomorrowTotalTasks!.finishedTasksCount + (task.finished ? -1 : 1),
        );
      },
      callbackWeek: () async {
        weekTotalTasks = weekTotalTasks?.copyWith(
          finishedTasksCount:
              weekTotalTasks!.finishedTasksCount + (task.finished ? -1 : 1),
        );
      },
    );

    setLoading(false);
    notifyListeners();
  }

  Future<void> toggleShowFinishedTasks() async {
    showFinishedTasks = !showFinishedTasks;
    await refreshPage();
  }

  Future<void> deleteTask(TaskModel task) async {}

  Future<void> _switchFromMultipleFiltersAndExecute({
    required List<TaskFilter> filters,
    Function()? callbackToday,
    Function()? callbackTomorrow,
    Function()? callbackWeek,
  }) async {
    filters.map((filter) async {
      return await _switchFromFilterAndExecute<void>(
        filter: filter,
        callbackToday: callbackToday,
        callbackTomorrow: callbackTomorrow,
        callbackWeek: callbackWeek,
      );
    });
  }

  Future<T> _switchFromFilterAndExecute<T>({
    required TaskFilter filter,
    Function()? callbackToday,
    Function()? callbackTomorrow,
    Function()? callbackWeek,
  }) async {
    switch (filter) {
      case TaskFilterToday():
        if (callbackToday != null) return callbackToday();
      case TaskFilterTomorrow():
        if (callbackTomorrow != null) return callbackTomorrow();
      case TaskFilterWeek():
        if (callbackWeek != null) return callbackWeek();
    }

    return T as FutureOr<T>;
  }
}
