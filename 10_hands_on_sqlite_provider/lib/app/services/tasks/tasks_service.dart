import '../../models/task_model.dart';
import '../../models/week_task_model.dart';

abstract class TasksService {
  Future<void> createTask(DateTime date, String description);
  Future<List<TaskModel>> getTodayTasks();
  Future<List<TaskModel>> getTomorrowTasks();
  Future<WeekTaskModel> getWeekTasks();
  Future<void> toggleTaskStatus(TaskModel task);
}
