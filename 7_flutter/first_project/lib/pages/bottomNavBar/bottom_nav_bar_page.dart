import 'package:first_project/pages/bottomNavBar/first_page.dart';
import 'package:first_project/pages/bottomNavBar/second_page.dart';
import 'package:flutter/material.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({Key? key}) : super(key: key);

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar'),
      ),
      body: IndexedStack(
        index: _index,
        children: const [
          FirstPage(),
          SecondPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (value) {
          setState(() {
            _index = value;
          });
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
