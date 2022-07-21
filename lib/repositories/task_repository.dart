import 'package:checkitout/models/task.model.dart';
import 'package:flutter/material.dart';

class TaskRepository extends ChangeNotifier {
  List<TaskModel> _tasks = [];
  List<TaskModel> _swaptasks = [];

  List<TaskModel> get tasks => _tasks;

  TaskRepository();

  save(String task) async {
    final todo = TaskModel(title: task, done: false);
    tasks.add(todo);
    notifyListeners();
  }

  getAll() async {
    _tasks = _swaptasks;
    notifyListeners();
  }

  getTasksNotDone() async {
    _swaptasks = _tasks;
    _tasks = tasks.where(((task) => !task.done)).toList();
  }
}
