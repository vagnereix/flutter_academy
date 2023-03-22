import 'package:flutter/material.dart';

class LayoutBuilderPage extends StatelessWidget {
  const LayoutBuilderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LayoutBuilder'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: constraints.maxHeight * .5,
              width: constraints.maxWidth * .5,
              color: Colors.amber[700],
            ),
            Container(
              height: constraints.maxHeight * .5,
              width: constraints.maxWidth,
              color: Colors.amber[900],
            ),
          ],
        ),
      ),
    );
  }
}
