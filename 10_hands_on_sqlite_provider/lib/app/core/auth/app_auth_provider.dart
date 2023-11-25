import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../services/user/user_service.dart';
import '../navigator/app_navigator.dart';

class AppAuthProvider extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth;
  final UserService _userService;

  AppAuthProvider({
    required FirebaseAuth firebaseAuth,
    required UserService userService,
  })  : _firebaseAuth = firebaseAuth,
        _userService = userService;

  User? get user => _firebaseAuth.currentUser;
  Future<void> logout() => _userService.logout();

  void loadListener() {
    _firebaseAuth.userChanges().listen((_) {
      notifyListeners();
    });

    _firebaseAuth.authStateChanges().listen((user) async {
      if (user != null) {
        Future.delayed(const Duration(seconds: 1), () async {
          AppNavigator.to.pushNamedAndRemoveUntil('/home', (_) => false);
        });
      } else {
        Future.delayed(const Duration(seconds: 1), () async {
          AppNavigator.to.pushNamedAndRemoveUntil('/login', (_) => false);
        });
      }

      notifyListeners();
    });
  }
}
