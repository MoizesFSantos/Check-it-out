import 'package:checkitout/components/empty_page_component.dart';
import 'package:checkitout/components/loading_component.dart';
import 'package:checkitout/models/task.model.dart';
import 'package:checkitout/repositories/task_repository.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var tasks = context.watch<TaskRepository>();
    return Scaffold(
        appBar: AppBar(
          title: Text('Tasks'),
          centerTitle: true,
        ),
        body: Center(child: EmptyPage()));
  }
}
