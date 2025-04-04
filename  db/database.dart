import 'package:floor/floor.dart';
import 'dart:async';
import 'task_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart'; 

@Database(version: 1, entities: [Task])
abstract class AppDatabase extends FloorDatabase {
  TaskDao get taskDao;
}
