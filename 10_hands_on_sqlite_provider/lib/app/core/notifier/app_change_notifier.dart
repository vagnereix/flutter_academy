import 'package:flutter/material.dart';

class AppChangeNotifier extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  String? _error;
  String? get error => _error;
  bool get hasError => _error != null;

  bool _success = false;
  bool get success => _success;

  void setLoading(bool value) {
    _loading = value;
  }

  void setError(String? message) {
    _error = message;
  }

  void setSuccess(bool value) {
    _success = value;
  }

  void resetState() {
    setError(null);
    setSuccess(false);
  }

  void showLoaderAndResetState() {
    setLoading(true);
    resetState();
  }
}
