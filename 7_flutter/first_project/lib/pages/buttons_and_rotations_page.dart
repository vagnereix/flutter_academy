import 'package:flutter/material.dart';

import '../components/button_widget.dart';

class ButtonsAndRotationsPage extends StatelessWidget {
  const ButtonsAndRotationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons & Rotations'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.red[900],
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(4),
                      bottomRight: Radius.circular(4),
                    ),
                  ),
                  // Rotaciona em sentido horário
                  child: const RotatedBox(
                    quarterTurns: -1,
                    child: Text(
                      'Vagner',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                minimumSize: const Size(200, 50),
                backgroundColor: Colors.red.shade900,
              ),
              child: const Text(
                'TextButtonWidget',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            IconButton(
              tooltip: 'IconButton',
              onPressed: () {},
              color: Colors.red.shade900,
              icon: const Icon(
                Icons.music_note_rounded,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade900,
                padding: const EdgeInsets.all(20),
              ),
              child: const Text(
                'ElevatedButton',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton.icon(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.red.shade500;
                    }

                    return Colors.red.shade900;
                  },
                ),
                padding: const MaterialStatePropertyAll(
                  EdgeInsets.all(20),
                ),
              ),
              icon: const Icon(Icons.icecream_rounded, color: Colors.white),
              label: const Text(
                'ElevatedButtonIcon',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            InkWell(
              onLongPress: () {
                debugPrint('Long press from InkWell');
              },
              child: const ButtonWidget(name: 'InkWell'),
            ),
            const SizedBox(
              height: 25,
            ),
            GestureDetector(
              onVerticalDragStart: (details) => debugPrint(
                'Drag started: $details',
              ),
              onVerticalDragEnd: (details) => debugPrint(
                'Drag ended: $details',
              ),
              onVerticalDragUpdate: (details) => debugPrint(
                'Drag updated, localPosition ${details.localPosition} and globalPosition ${details.globalPosition}',
              ),
              child: const ButtonWidget(
                name: 'GestureDetector',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
