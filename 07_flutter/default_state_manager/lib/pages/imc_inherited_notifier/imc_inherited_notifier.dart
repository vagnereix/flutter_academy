import 'dart:math';

import 'package:flutter/material.dart';

class ImcInheritedNotifier extends InheritedNotifier<ValueNotifier<double?>> {
  ImcInheritedNotifier({
    super.key,
    required super.child,
  }) : super(
          notifier: ValueNotifier(null),
        );

  double? get imc => notifier?.value;

  void calculateIMC({required double weight, required double height}) {
    notifier?.value = weight / pow(height, 2);
  }

  static ImcInheritedNotifier of(BuildContext context) {
    final imcInheritedNotifier =
        context.dependOnInheritedWidgetOfExactType<ImcInheritedNotifier>();

    assert(
      imcInheritedNotifier != null,
      'ImcInheritedNotifier not exists on BuildContext',
    );

    return imcInheritedNotifier!;
  }
}
