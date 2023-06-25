import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/set_state');
              },
              style: const ButtonStyle(
                minimumSize: MaterialStatePropertyAll(
                  Size(150, 40),
                ),
              ),
              child: const Text('SetSate'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/value_notifier');
              },
              style: const ButtonStyle(
                minimumSize: MaterialStatePropertyAll(
                  Size(150, 40),
                ),
              ),
              child: const Text('ValueNotifier'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/change_notifier');
              },
              style: const ButtonStyle(
                minimumSize: MaterialStatePropertyAll(
                  Size(150, 40),
                ),
              ),
              child: const Text('ChangeNotifier'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/bloc_pattern');
              },
              style: const ButtonStyle(
                minimumSize: MaterialStatePropertyAll(
                  Size(150, 40),
                ),
              ),
              child: const Text('BlocPattern'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/inherited_widget');
              },
              style: const ButtonStyle(
                minimumSize: MaterialStatePropertyAll(
                  Size(150, 40),
                ),
              ),
              child: const Text('InheritedWidget'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/inherited_notifier');
              },
              style: const ButtonStyle(
                minimumSize: MaterialStatePropertyAll(
                  Size(150, 40),
                ),
              ),
              child: const Text('InheritedNotifier'),
            ),
          ],
        ),
      ),
    );
  }
}
