import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:synchronized/synchronized.dart';

import 'sqlite_migrations_factory.dart';

// Singleton class to create a connection to the database
class SqliteConnectionFactory {
  SqliteConnectionFactory._() {
    print('NOVA_INSTANCIA');
  }

  static final SqliteConnectionFactory _instance = SqliteConnectionFactory._();

  static SqliteConnectionFactory get instance => _instance;

  static const _DB_VERSION = 1;
  static const _DB_NAME = '10_TODO_LIST_APP';

  final _lock = Lock();

  Database? _db;

  Future<Database> getDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _DB_NAME);

    if (_db == null) {
      await _lock.synchronized(() async {
        _db ??= await openDatabase(
          path,
          version: _DB_VERSION,
          onCreate: _onCreate,
          onConfigure: _onConfigure,
          onUpgrade: _onUpdate,
          onDowngrade: _onDowngrade,
        );
      });
    }

    return _db as Database;
  }

  Future<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future<void> _onCreate(Database db, int version) async {
    final batch = db.batch();
    final migrations = SqliteMigrationsFactory().getCreateMigrations();

    for (var migration in migrations) {
      migration.create(batch);
    }

    batch.commit();
  }

  Future<void> _onUpdate(Database db, int oldV, int version) async {
    final batch = db.batch();
    final migrations = SqliteMigrationsFactory().getUpdateMigrations(oldV);

    for (var migration in migrations) {
      migration.update(batch);
    }

    batch.commit();
  }

  Future<void> _onDowngrade(Database db, int oldVersion, int version) async {}

  void closeConnection() {
    _db?.close();
    _db = null;
  }
}
