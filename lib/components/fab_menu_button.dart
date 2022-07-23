// ignore_for_file: prefer_const_constructors

import 'package:checkitout/screens/newCategory.dart';
import 'package:checkitout/screens/newTask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class FabMenuButton extends StatefulWidget {
  const FabMenuButton({Key? key}) : super(key: key);

  @override
  State<FabMenuButton> createState() => _FabMenuButtonState();
}

class _FabMenuButtonState extends State<FabMenuButton>
    with SingleTickerProviderStateMixin {
  final actionButtonColor = Colors.white;
  late AnimationController animation;
  final menuIsOpen = ValueNotifier<bool>(false);

  _openCategory(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return NewCategory();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  toggleMenu() {
    menuIsOpen.value ? animation.reverse() : animation.forward();
    menuIsOpen.value = !menuIsOpen.value;
  }

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.add,
      activeIcon: Icons.close,
      overlayOpacity: 0.2,
      spacing: 3,
      children: [
        SpeedDialChild(
            child: Icon(
              Icons.task_alt,
              color: Colors.indigo,
            ),
            label: 'New Task',
            backgroundColor: Colors.white,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewTask(),
                ),
              );
            }),
        SpeedDialChild(
            child: Icon(
              Icons.category,
              color: Colors.indigo,
            ),
            label: 'New Category',
            backgroundColor: Colors.white,
            onTap: () {
              _openCategory(context);
            }),
      ],
    );
  }
}
