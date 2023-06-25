import 'package:first_project/pages/bottomNavBar/first_page.dart';
import 'package:first_project/pages/bottomNavBar/second_page.dart';
import 'package:flutter/material.dart';

class PageViewPage extends StatefulWidget {
  const PageViewPage({Key? key}) : super(key: key);

  @override
  State<PageViewPage> createState() => _PageViewPageState();
}

class _PageViewPageState extends State<PageViewPage> {
  int _index = 0;
  final pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageView'),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (value) => setState(() {
          _index = value;
        }),
        children: const [
          FirstPage(),
          SecondPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (value) {
          pageController.animateToPage(
            value,
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        },
        items: const [
          BottomNavigationBarItem(
            label: 'First page',
            icon: Icon(Icons.camera),
          ),
          BottomNavigationBarItem(
            label: 'Second page',
            icon: Icon(Icons.camera),
          ),
        ],
      ),
    );
  }
}
