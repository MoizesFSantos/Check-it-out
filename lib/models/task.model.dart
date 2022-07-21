import 'package:objectbox/objectbox.dart';

@Entity()
class TaskModel {
  int id = 0;
  String title;
  String? category;
  String? date;
  bool done;

  TaskModel({required this.title, required this.done});
}
