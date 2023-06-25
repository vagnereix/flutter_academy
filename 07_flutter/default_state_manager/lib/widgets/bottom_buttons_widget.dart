import 'package:flutter/material.dart';

class BottomButtonsWidget extends StatelessWidget {
  const BottomButtonsWidget({
    Key? key,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  final void Function() onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
            child: TextButton(
              style: TextButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Voltar'),
            ),
          ),
        ),
        Container(
          width: 1,
          height: 50,
          decoration: const BoxDecoration(
            color: Colors.grey,
          ),
        ),
        Expanded(
          child: Container(
            height: 50,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
            child: TextButton(
              style: TextButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              onPressed: onPressed,
              child: Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
