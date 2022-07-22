import 'package:checkitout/database/databse.dart';
import 'package:checkitout/repositories/categories_repository.dart';
import 'package:checkitout/repositories/task_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final providers = <SingleChildWidget>[
  Provider<DataBase>(create: ((context) => DataBase())),
  ChangeNotifierProvider<TaskRepository>(
      create: (context) => TaskRepository(context.read())),
  ChangeNotifierProvider<CategoryRepository>(
      create: (context) => CategoryRepository(context.read())),
];
