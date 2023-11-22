import 'package:sqflite/sqflite.dart';

import '../../core/database/sqlite_connection_factory.dart';
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
}
