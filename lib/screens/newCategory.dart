import 'package:flutter/material.dart';

class NewCategory extends StatelessWidget {
  const NewCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Category'),
      ),
      body: Center(),
    );
  }
}
