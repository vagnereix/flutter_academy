import 'package:flutter/material.dart';

import '../../../core/notifier/app_change_notifier.dart';
import '../../../core/ui/messages.dart';
import '../../../exceptions/auth_exception.dart';
import '../../../services/user/user_service.dart';

class LoginController extends AppChangeNotifier {
  final UserService _userService;

  LoginController({required UserService userService})
      : _userService = userService;

  Future<void> login(String email, String password) async {
    try {
      showLoaderAndResetState();
      notifyListeners();

      final user = await _userService.login(email, password);

      if (user != null) {
        setSuccess(true);
      } else {
        setError('Usuário não encontrado');
      }
    } on AuthException catch (e) {
      setError(e.message);
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      showLoaderAndResetState();
      notifyListeners();

      final user = await _userService.signInWithGoogle();

      if (user != null) {
        setSuccess(true);
      } else {
        _userService.logout();
        setError('Usuário não encontrado');
      }
    } on AuthException catch (e) {
      _userService.logout();
      setError(e.message);
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }

  Future<void> forgotPassword(BuildContext context, String email) async {
    try {
      showLoaderAndResetState();
      notifyListeners();

      await _userService.forgotPassword(email);

      if (context.mounted) {
        Messages.of(context).showInfo(
          'E-mail de redefinição enviado com sucesso',
        );
      }
    } on AuthException catch (e) {
      setError(e.message);
    } catch (e) {
      setError('Erro ao enviar e-mail de redefinição');
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }
}
