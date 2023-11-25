import '../../models/task_model.dart';
import '../../models/week_task_model.dart';
import '../../repositories/tasks/tasks_repository.dart';
import 'tasks_service.dart';

class TasksServiceImpl implements TasksService {
  final TasksRepository _tasksRepository;

  TasksServiceImpl({required TasksRepository tasksRepository})
      : _tasksRepository = tasksRepository;

  @override
  Future<void> createTask(DateTime date, String description) =>
      _tasksRepository.createTask(date, description);

  @override
  Future<List<TaskModel>> getTodayTasks() => _tasksRepository.getTasksByPeriod(
        DateTime.now(),
        DateTime.now(),
      );

  @override
  Future<List<TaskModel>> getTomorrowTasks() =>
      _tasksRepository.getTasksByPeriod(
        DateTime.now().add(const Duration(days: 1)),
        DateTime.now().add(const Duration(days: 1)),
      );

  @override
  Future<WeekTaskModel> getWeekTasks() async {
    DateTime firstDayOfTheWeek = DateTime.now();

    if (firstDayOfTheWeek.weekday != DateTime.monday) {
      final int difference = firstDayOfTheWeek.weekday - DateTime.monday;

      firstDayOfTheWeek = firstDayOfTheWeek.subtract(
        Duration(days: difference),
      );
    }

    final DateTime lastDayOfTheWeek = firstDayOfTheWeek.add(
      const Duration(days: 7),
    );

    final tasks = await _tasksRepository.getTasksByPeriod(
      firstDayOfTheWeek,
      lastDayOfTheWeek,
    );

    return WeekTaskModel(
      startDate: firstDayOfTheWeek,
      endDate: lastDayOfTheWeek,
      tasks: tasks,
    );
  }

  @override
  Future<void> toggleTaskStatus(TaskModel task) =>
      _tasksRepository.toggleTaskStatus(task);
}
