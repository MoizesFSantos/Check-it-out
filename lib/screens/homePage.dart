// ignore_for_file: prefer_const_constructors

import 'package:checkitout/components/fab_menu_button.dart';
import 'package:checkitout/screens/categoriesPage.dart';
import 'package:checkitout/screens/taskPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int initialPage = 0;
  late PageController pc;

  @override
  void initState() {
    // TODO: implement initState
    pc = PageController(initialPage: initialPage);
  }

  setPage(page) {
    setState(() {
      initialPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pc,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          TaskScreen(),
          CategScreen(),
        ],
        onPageChanged: setPage,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: initialPage,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.task_alt), label: 'Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categories'),
        ],
        onTap: (page) {
          pc.animateToPage(page,
              duration: Duration(milliseconds: 400), curve: Curves.decelerate);
        },
      ),
      floatingActionButton: FabMenuButton(),
    );
  }
}
