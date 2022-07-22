import 'package:objectbox/objectbox.dart';

@Entity()
class CategoryModel {
  int id = 0;

  String title;

  CategoryModel(this.id, this.title);
}
