import 'package:sqflite/sqflite.dart';

import '../../core/database/sqlite_connection_factory.dart';
import '../../models/task_model.dart';
import 'tasks_repository.dart';

class TasksRepositoryImpl extends TasksRepository {
  final SqliteConnectionFactory _connectionFactory;

  TasksRepositoryImpl({required SqliteConnectionFactory connectionFactory})
      : _connectionFactory = connectionFactory;

  @override
  Future<void> createTask(DateTime date, String description) async {
    final db = await _connectionFactory.getDatabase();

    await db.insert(
      'tasks',
      {
        'date': date.toIso8601String(),
        'description': description,
        'status': 0,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<TaskModel>> getTasksByPeriod(
    DateTime startDate,
    DateTime endDate,
  ) async {
    final startDateWithInitialHours = DateTime(
      startDate.year,
      startDate.month,
      startDate.day,
      0,
      0,
      0,
    );
    final endDateWithFinalHours = DateTime(
      endDate.year,
      endDate.month,
      endDate.day,
      23,
      59,
      59,
    );

    final db = await _connectionFactory.getDatabase();

    final data = await db.rawQuery(
      'SELECT * FROM tasks WHERE date BETWEEN ? AND ? ORDER BY date ASC',
      [
        startDateWithInitialHours.toIso8601String(),
        endDateWithFinalHours.toIso8601String(),
      ],
    );

    return data.map((task) => TaskModel.fromMap(task)).toList();
  }

  @override
  Future<void> toggleTaskStatus(TaskModel task) async {
    final db = await _connectionFactory.getDatabase();

    await db.update(
      'tasks',
      {
        'status': task.finished ? 1 : 0,
      },
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }
}
