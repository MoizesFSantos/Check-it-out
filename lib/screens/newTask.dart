import 'package:flutter/material.dart';

class NewTask extends StatelessWidget {
  const NewTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Task'),
      ),
      body: Center(),
    );
  }
}
