import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseSqlite {
  Future<Database> createDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, '8_FLUTTER_SQLITE');

    return await openDatabase(
      path,
      version: 2,
      onConfigure: (Database db) => db.execute('PRAGMA foreign_keys = ON'),
      onCreate: (Database db, int version) {
        db.execute(
          '''
            CREATE TABLE users(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              name VARCHAR(200)
            )
          ''',
        );

        db.execute(
          '''
            CREATE TABLE products(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              name VARCHAR(200),
              description VARCHAR(500)
            )
          ''',
        );

        print('Banco de dados criado com sucesso!');
      },
      onUpgrade: (Database db, int oldVersion, int version) {
        if (oldVersion == 1) {
          db.execute(
            '''
              CREATE TABLE products(
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                name VARCHAR(200),
                description VARCHAR(500)
              )
            ''',
          );
        }

        print('Banco de dados atualizado com sucesso!');
      },
      onDowngrade: onDatabaseDowngradeDelete,
    );
  }
}
