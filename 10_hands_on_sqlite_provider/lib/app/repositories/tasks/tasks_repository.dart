import '../../models/task_model.dart';

abstract class TasksRepository {
  Future<void> createTask(DateTime date, String description);
  Future<List<TaskModel>> getTasksByPeriod(
    DateTime startDate,
    DateTime endDate,
  );
}
