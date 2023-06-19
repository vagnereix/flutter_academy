import 'package:sqflite/sqflite.dart';

import 'migration.dart';

class MigrationV3 implements Migration {
  static const _MVERSION = 3;

  @override
  void create(Batch batch) {
    batch.execute(
        '''
      CREATE TABLE tasks (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        description TEXT NOT NULL,
        date DATETIME NOT NULL,
        status INTEGER NOT NULL
      )
    ''');
  }

  @override
  void update(Batch batch) {}

  @override
  int get version => _MVERSION;
}
