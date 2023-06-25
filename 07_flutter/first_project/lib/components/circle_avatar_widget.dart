import 'package:flutter/material.dart';

class CircleAvatarWidget extends StatelessWidget {
  const CircleAvatarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            gradient: const LinearGradient(
              colors: [
                Colors.amber,
                Colors.deepOrange,
                Colors.pink,
              ],
            ),
          ),
        ),
        SizedBox(
          width: 80,
          height: 80,
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 80,
          height: 80,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://github.com/vagnereix.png',
              ),
            ),
          ),
        ),
        SizedBox(
          width: 80,
          height: 80,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 2,
                horizontal: 4,
              ),
              decoration: BoxDecoration(
                color: Colors.pink.shade600,
              ),
              child: const Text(
                'AO VIVO',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 80,
          height: 95,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              'vagnereix.dev',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade900,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
