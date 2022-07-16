import 'package:checkitout/database/app_database.dart';
import 'package:checkitout/models/task.model.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class TaskRepository extends ChangeNotifier {
  late Database db;

  TaskRepository() {
    _initRepository();
  }

  _initRepository() async {
    await _getTasks();
  }

  _getTasks() async {
    db = DB.instance.database;
    await db.query('tasks');
    notifyListeners();
  }

  insetTask(TaskModel task) async {
    db = DB.instance.database;
    return await db.insert('tasks', task.taskMap());
  }
}
