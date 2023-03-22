import 'package:flutter/material.dart';

class ColorsPage extends StatelessWidget {
  const ColorsPage({super.key});

  static final defaultColor = Colors.red.shade900;
  static const decimalColor = Color(0xFFC345FD);
  static const rgboColor = Color.fromRGBO(255, 72, 0, 0.87);
  static const argbColor = Color.fromARGB(255, 86, 0, 223);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Colors'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: defaultColor,
              ),
              width: 200,
              child: const Center(
                child: Text(
                  'Colors.red.shade900',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: decimalColor,
              ),
              width: 200,
              child: const Center(
                child: Text(
                  'Color(0xFFC345FD)',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: rgboColor,
              ),
              width: 200,
              child: const Center(
                child: Text(
                  'Color.fromRGBO(255, 72, 0, 0.87)',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: argbColor,
              ),
              width: 200,
              child: const Center(
                child: Text(
                  'Color.fromARGB(255, 86, 0, 223)',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
