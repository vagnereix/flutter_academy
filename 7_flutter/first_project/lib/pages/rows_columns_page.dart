import 'package:flutter/material.dart';

class RowsColumnsPage extends StatelessWidget {
  const RowsColumnsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rows & Columns',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Exemplificando Columns'),
            const Text('Exemplificando Columns'),
            const Text('Exemplificando Columns'),
            Container(
              height: 100,
              color: Colors.grey[500],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text('Exemplificando Rows'),
                  Text('Exemplificando Rows'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
