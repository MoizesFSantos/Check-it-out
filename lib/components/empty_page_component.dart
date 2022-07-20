import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/imgs/empty_img.png'),
          Text(
            'Add new Task ...',
            style: TextStyle(fontSize: 24, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
