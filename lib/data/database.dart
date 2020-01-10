import 'dart:async';
import 'dart:io';

import 'package:noteme/models/task.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  DatabaseHelper._createInstance();

  String taskID = 'id';
  String taskName = 'name';
  String taskAddTime = 'addTime';
  String taskRememberTime = 'rememberTime';
  String taskPriority = 'priprity';
  String taskStatus = 'status';
  String taskTable = 'tasks';

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initialDatabase();
    }
    return _database;
  }

  Future<Database> initialDatabase() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String path = join(appDocDir.path, "database.db");
    var db = openDatabase(path, version: 1, onCreate: _createDB);
    return db;
  }

  void _createDB(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $taskTable($taskID INTIGER PRIMARY KEY AUTOINCREMENT,$taskName TEXT,$taskAddTime DATE,$taskRememberTime DATE,$taskPriority INTEGER, $taskStatus INTEGER)');
  }

  Future<List<Map<String, dynamic>>> getTasks() async {
    Database database = await this.database;
    var result = await database
        .rawQuery('SELECT * FROM $taskTable ORDER BY $taskAddTime ASC');
    return result;
  }

  Future<int> saveTask(Task task) async {
    Database database = await this.database;
    var result = await database.insert(taskTable, task.toJson());
    return result;
  }

  Future<int> updateTask(Task task) async {
    Database database = await this.database;
    var result = await database.update(taskTable, task.toJson(),
        where: '$taskID', whereArgs: [taskID]);
    return result;
  }

  Future<int> deleteTask(Task task) async {
    Database database = await this.database;
    var result =
        await database.delete(taskTable, where: '$taskID', whereArgs: [taskID]);
    return result;
  }

  Future<List<Task>> getTaskList() async {
    var taskListMap = await getTasks();
    int count = taskListMap.length;
    List<Task> taskList = List<Task>();
    for (int i = 0; i < count; i++) {
      taskList.add(Task.fromJson(taskListMap[i]));
    }
    return taskList;
  }
}
