import 'package:checkitout/database/app_database.dart';
import 'package:checkitout/models/category.model.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class CategoryRepository extends ChangeNotifier {
  late Database db;

  CategoryRepository() {
    _initRepository();
  }

  _initRepository() async {
    await _getCategories();
  }

  _getCategories() async {
    db = DB.instance.database;
    await db.query('categories');
    notifyListeners();
  }

  insetCategory(CategoryModel category) async {
    db = DB.instance.database;
    return await db.insert('categories', category.categoryMap());
  }
}
