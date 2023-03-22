import 'dart:math';

import 'package:flutter/material.dart';

class ImcChangeNotifierController extends ChangeNotifier {
  double? _imc;

  double? get imc => _imc;

  void calculateIMC({required double weight, required double height}) {
    _imc = weight / pow(height, 2);

    notifyListeners();
  }
}
