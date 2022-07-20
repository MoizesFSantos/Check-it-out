class CategoryModel {
  int id;

  String title;

  CategoryModel(this.id, this.title);

  categoryMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id;
    mapping['title'] = title;

    return mapping;
  }
}
