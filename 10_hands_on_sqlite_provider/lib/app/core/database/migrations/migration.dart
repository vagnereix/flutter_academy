import 'package:sqflite/sqflite.dart';

abstract class Migration {
  int get version;

  void create(Batch batch);
  void update(Batch batch);
}
