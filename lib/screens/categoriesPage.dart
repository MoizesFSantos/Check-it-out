// ignore_for_file: prefer_const_constructors

import 'package:checkitout/components/empty_page_component.dart';
import 'package:checkitout/components/loading_component.dart';
import 'package:checkitout/repositories/categories_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategScreen extends StatefulWidget {
  const CategScreen({Key? key}) : super(key: key);

  @override
  State<CategScreen> createState() => _CategScreenState();
}

class _CategScreenState extends State<CategScreen> {
  final loading = ValueNotifier(true);
  final showTasksNotDone = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      loading.value = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Flexible(
              child: ValueListenableBuilder<bool>(
            valueListenable: loading,
            builder: (context, load, _) => Consumer<CategoryRepository>(
                builder: (context, repository, child) {
              final tasks = repository.categories;

              if (load) {
                return Loading();
              }
              if (tasks.isEmpty) {
                return EmptyPage(
                  type: 'Category',
                );
              }
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                    child: Card(
                      elevation: 6.0,
                      child: ListTile(
                        leading: IconButton(
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.indigo,
                          ),
                          onPressed: () {},
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              repository.categories[index].title,
                              style: TextStyle(fontSize: 20.0),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.delete, color: Colors.indigo),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: repository.categories.length,
              );
            }),
          )),
        ],
      ),
    );
  }
}
