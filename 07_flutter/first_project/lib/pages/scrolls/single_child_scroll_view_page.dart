import 'package:flutter/material.dart';

class SingleChildScrollViewPage extends StatelessWidget {
  const SingleChildScrollViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SingleChildScrollView'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.red.shade900,
              height: 300,
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              color: Colors.amber.shade900,
              height: 300,
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              color: Colors.purple.shade900,
              height: 300,
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              color: Colors.cyan.shade600,
              height: 300,
              width: MediaQuery.of(context).size.width,
            ),
          ],
        ),
      ),
    );
  }
}
