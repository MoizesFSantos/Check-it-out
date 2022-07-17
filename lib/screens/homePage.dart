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
        children: [
          TaskScreen(),
          CategScreen(),
        ],
        onPageChanged: setPage,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: initialPage,
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
    );
  }
}
