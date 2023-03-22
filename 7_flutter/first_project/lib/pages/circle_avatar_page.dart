import 'package:first_project/components/circle_avatar_widget.dart';
import 'package:flutter/material.dart';

class CircleAvatarPage extends StatelessWidget {
  const CircleAvatarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CircleAvatar custom'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemCount: 8,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => const CircleAvatarWidget(),
        separatorBuilder: (context, index) => const SizedBox(
          width: 8,
        ),
      ),
    );
  }
}
