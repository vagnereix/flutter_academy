import 'package:flutter/material.dart';

import '../database/database_sqlite.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    _database();
    super.initState();
  }

  void _database() async {
    final db = await DatabaseSqlite().createDatabase();

    db.insert('users', {'name': 'Vagner Reis'});
    db.insert('users', {'name': 'Vagner Reix'});
    db.insert('users', {'name': 'Antonio Queiroz'});
    db.update(
      'users',
      {'name': 'Dos Reis, Vagner'},
      where: 'name = ?',
      whereArgs: ['Antonio Queiroz'],
    );
    db.delete('users', where: 'name = ?', whereArgs: ['Vagner Reis']);

    final users = await db.query('users');
    debugPrint(users.toString());

    db.rawInsert('INSERT INTO users(name) VALUES(?)', ['Vagner Reis']);
    db.rawUpdate(
      'UPDATE users SET name = ? WHERE name = ?',
      ['Dos Reix, Vag', 'Vagner Reis'],
    );
    db.rawDelete('DELETE FROM users WHERE name = ?', ['Vagner Reis']);

    final rawUsers = db.rawQuery('SELECT * FROM users');
    debugPrint(rawUsers.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(),
    );
  }
}
