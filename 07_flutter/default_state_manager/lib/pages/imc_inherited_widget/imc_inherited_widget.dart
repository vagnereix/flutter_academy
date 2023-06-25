import 'package:flutter/material.dart';

class ImcInheritedWidget extends InheritedWidget {
  final double imc;

  const ImcInheritedWidget({
    super.key,
    required this.imc,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant ImcInheritedWidget oldWidget) {
    return imc != oldWidget.imc;
  }

  static ImcInheritedWidget of(BuildContext context) {
    final imcInheritedWidget =
        context.dependOnInheritedWidgetOfExactType<ImcInheritedWidget>();

    assert(
      imcInheritedWidget != null,
      'ImcInheritedWidget not exists on BuildContext',
    );

    return imcInheritedWidget!;
  }
}
