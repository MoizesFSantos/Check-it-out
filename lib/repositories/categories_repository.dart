// ignore_for_file: prefer_final_fields

import 'package:checkitout/database/databse.dart';
import 'package:checkitout/database/objectbox.g.dart';
import 'package:checkitout/models/category.model.dart';
import 'package:flutter/material.dart';

class CategoryRepository extends ChangeNotifier {
  List<CategoryModel> _categories = [];
  List<CategoryModel> _swampCategories = [];
  late final DataBase _dataBase;

  List<CategoryModel> get categories => _categories;

  CategoryRepository(this._dataBase);

  Future<Box> getBox() async {
    final store = await _dataBase.getStore();
    return store.box<CategoryModel>();
  }

  save(String title) async {
    final data = CategoryModel(title);
    final box = await getBox();
    box.put(data);
    categories.add(data);
    notifyListeners();
  }

  update(CategoryModel category) async {
    final box = await getBox();
    box.put(category);
    categories.add(category);
    notifyListeners();
  }

  getAll() async {
    final box = await getBox();
    _categories = box.getAll() as List<CategoryModel>;
    notifyListeners();
  }

  remove(CategoryModel data) async {
    final box = await getBox();
    box.remove(data.id);
    categories.remove(data);
    notifyListeners();
  }
}
