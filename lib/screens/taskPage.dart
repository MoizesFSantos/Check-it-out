// ignore_for_file: prefer_const_constructors

import 'package:checkitout/components/empty_page_component.dart';
import 'package:checkitout/components/loading_component.dart';
import 'package:checkitout/repositories/task_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final loading = ValueNotifier(true);
  final showTasksNotDone = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      getFilterTasks();
      loading.value = false;
    });
    showTasksNotDone.addListener(getFilterTasks);
  }

  @override
  void dispose() {
    showTasksNotDone.removeListener(getFilterTasks);
    super.dispose();
  }

  getFilterTasks() async {
    showTasksNotDone.value
        ? await context.read<TaskRepository>().getTasksNotDone()
        : await context.read<TaskRepository>().getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tasks'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Flexible(
              child: ValueListenableBuilder<bool>(
                valueListenable: loading,
                builder: (context, load, _) => Consumer<TaskRepository>(
                  builder: (context, repository, child) {
                    final tasks = repository.tasks;

                    if (load) {
                      return Loading();
                    }
                    if (tasks.isEmpty) {
                      return EmptyPage();
                    }
                    return ListView.separated(
                        itemBuilder: (context, index) => ListTile(
                              leading: Checkbox(
                                value: tasks[index].done,
                                onChanged: (newVal) {},
                              ),
                              title: Text(tasks[index].title),
                              subtitle: Text(tasks[index].category),
                              //trailing: ,
                            ),
                        separatorBuilder: (context, index) {
                          return Divider(
                            thickness: 0.5,
                            height: 0.5,
                          );
                        },
                        itemCount: repository.tasks.length);
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
