import 'package:checkitout/delegates/fab_vertical.dart';
import 'package:flutter/material.dart';

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
    return Flow(
      clipBehavior: Clip.none,
      delegate: FabVerticalDelegate(animation: animation),
      children: [
        FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => toggleMenu(),
        ),
        FloatingActionButton(
          child: Icon(
            Icons.task_alt,
            color: Colors.indigo,
          ),
          onPressed: () {},
          backgroundColor: actionButtonColor,
        ),
        FloatingActionButton(
          child: Icon(
            Icons.category,
            color: Colors.indigo,
          ),
          onPressed: () {},
          backgroundColor: actionButtonColor,
        ),
      ],
    );
  }
}
