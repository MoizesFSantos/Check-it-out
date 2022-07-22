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

  save(String title, String category) async {
    final todo = TaskModel(title: title, category: category, done: false);
    final box = await getBox();
    box.put(todo);
    tasks.add(todo);
    notifyListeners();
  }

  update(TaskModel task) async {
    final box = await getBox();
    box.put(task);
    tasks.add(task);
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
    final box = await getBox();
    final query = box.query(TaskModel_.done.equals(false)).build();
    _tasks = query.find() as List<TaskModel>;
    query.close();
    notifyListeners();
  }
}
