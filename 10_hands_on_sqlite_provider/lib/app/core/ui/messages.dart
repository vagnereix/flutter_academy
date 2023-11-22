import 'package:flutter/material.dart';
import 'package:flutter_toastr/flutter_toastr.dart';

class Messages {
  final BuildContext context;

  Messages._(this.context);

  factory Messages.of(BuildContext context) => Messages._(context);

  void showError(String message) {
    _showMessage(message, Colors.red);
  }

  void showInfo(String message) {
    _showMessage(message, Colors.teal.shade200);
  }

  void _showMessage(String message, Color color) {
    FlutterToastr.show(
      message,
      context,
      backgroundColor: color,
      position: FlutterToastr.bottom,
      duration: FlutterToastr.lengthLong,
    );
  }
}
