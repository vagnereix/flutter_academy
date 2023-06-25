import 'package:flutter/material.dart';

class MediaQueryPage extends StatelessWidget {
  const MediaQueryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // notifications bar height
    final statusBarHeight = MediaQuery.of(context).padding.top;
    // app bar default height
    const appBarHeight = kToolbarHeight;

    final bodyHeight =
        MediaQuery.of(context).size.height - statusBarHeight - appBarHeight;
    final bodyWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('MediaQuerys'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: bodyHeight * .5,
            width: bodyWidth * .5,
            color: Colors.amber[700],
          ),
          Container(
            height: bodyHeight * .5,
            width: bodyWidth,
            color: Colors.amber[900],
          ),
        ],
      ),
    );
  }
}
