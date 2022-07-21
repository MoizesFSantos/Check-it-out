import 'package:checkitout/database/databse.dart';
import 'package:checkitout/database/objectbox.g.dart';
import 'package:checkitout/models/task.model.dart';
import 'package:flutter/material.dart';

class TaskRepository extends ChangeNotifier {
  List<TaskModel> _tasks = [];
  List<TaskModel> _swaptasks = [];
  late final DataBase _dataBase;

  List<TaskModel> get tasks => _tasks;

  TaskRepository(this._dataBase);

  Future<Box> getBox() async {
    final store = await _dataBase.getStore();
    return store.box<TaskModel>();
  }

  save(String task) async {
    final todo = TaskModel(title: task, done: false);
    final box = await getBox();
    box.put(todo);
    tasks.add(todo);
    notifyListeners();
  }

  getAll() async {
    final box = await getBox();
    _tasks = box.getAll() as List<TaskModel>;
    notifyListeners();
  }

  remove(TaskModel task) async {
    final box = await getBox();
    box.remove(task.id);
    tasks.remove(task);
    notifyListeners();
  }

  getTasksNotDone() async {
    _swaptasks = _tasks;
    _tasks = tasks.where(((task) => !task.done)).toList();
  }
}
