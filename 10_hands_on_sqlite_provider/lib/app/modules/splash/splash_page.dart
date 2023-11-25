import 'package:flutter/material.dart';

import '../../core/widgets/logo.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Logo(),
          ),
        ],
      ),
    );
  }
}
