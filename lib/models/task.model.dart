final String tableTask = 'task';
final String columnId = '_id';
final String columnTitle = 'title';
final String columnDone = 'isFinished';

class TaskModel {
  int id;
  String title;
  String category;
  String date;
  bool isFinished;

  TaskModel(this.id, this.title, this.category, this.date, this.isFinished);

  taskMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id;
    mapping['title'] = title;
    mapping['category'] = category;
    mapping['date'] = date;
    mapping['isFinished'] = isFinished;
  }
}
