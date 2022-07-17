import 'package:flutter/material.dart';

class CategScreen extends StatelessWidget {
  const CategScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        centerTitle: true,
      ),
    );
  }
}
