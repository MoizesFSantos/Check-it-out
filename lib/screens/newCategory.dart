// ignore_for_file: prefer_const_constructors

import 'package:checkitout/repositories/categories_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewCategory extends StatefulWidget {
  const NewCategory({Key? key}) : super(key: key);

  @override
  State<NewCategory> createState() => _NewCategoryState();
}

class _NewCategoryState extends State<NewCategory> {
  final _titulo = TextEditingController();

  salvar() async {
    context.read<CategoryRepository>().save(_titulo.text);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('New Category'),
      // ignore: prefer_const_literals_to_create_immutables
      actions: [
        TextField(
          controller: _titulo,
          onChanged: (value) {},
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter category name',
          ),
        ),
        SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              style: TextButton.styleFrom(primary: Colors.grey[700]),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: TextStyle(fontSize: 16),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                salvar();
              },
              child: Text(
                'Save',
                style: TextStyle(fontSize: 16),
              ),
            )
          ],
        )
      ],
    );
  }
}
