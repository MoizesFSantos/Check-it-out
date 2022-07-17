import 'package:checkitout/app.dart';
import 'package:checkitout/repositories/categories_repository.dart';
import 'package:checkitout/repositories/task_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => TaskRepository()),
      ChangeNotifierProvider(create: (context) => CategoryRepository()),
    ],
    child: const App(),
  ));
}
