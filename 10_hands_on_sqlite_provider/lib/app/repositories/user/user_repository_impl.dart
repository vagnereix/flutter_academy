import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../exceptions/auth_exception.dart';
import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseAuth _firebaseAuth;

  UserRepositoryImpl({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  @override
  Future<User?> register(String email, String password) async {
    try {
      final userCredentials = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      return userCredentials.user;
    } on FirebaseAuthException catch (e, s) {
      debugPrint('🐞 FirebaseAuthException: $e, Stacktrace: $s');

      if (e.code == 'email-already-in-use') {
        final signInMethods = await _firebaseAuth.fetchSignInMethodsForEmail(
          email,
        );

        if (signInMethods.contains('password')) {
          throw AuthException(message: 'Este e-mail já está em uso');
        } else {
          throw AuthException(message: 'E-mail já cadastrado');
        }
      } else if (e.code == 'weak-password') {
        throw AuthException(message: 'Senha muito fraca');
      } else if (e.code == 'invalid-email') {
        throw AuthException(message: 'E-mail inválido');
      } else {
        throw AuthException(message: 'Erro ao registrar usuário');
      }
    }
  }

  @override
  Future<User?> login(String email, String password) async {
    try {
      final userCredentials = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredentials.user;
    } on PlatformException catch (e, s) {
      debugPrint('🐞 PlatformException: $e, Stacktrace: $s');

      throw AuthException(message: e.message ?? 'Erro ao fazer login');
    } on FirebaseAuthException catch (e, s) {
      debugPrint('🐞 FirebaseAuthException: $e, Stacktrace: $s');

      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        final signInMethods = await _firebaseAuth.fetchSignInMethodsForEmail(
          email,
        );

        if (signInMethods.contains('google')) {
          throw AuthException(
            message: 'E-mail cadastrado via Google, faça login com o mesmo',
          );
        }
        throw AuthException(
          message: 'Erro ao fazer login, credenciais inválidas',
        );
      }

      throw AuthException(message: e.message ?? 'Erro ao fazer login');
    }
  }

  @override
  Future<void> forgotPassword(String email) async {
    try {
      final signInMethods = await _firebaseAuth.fetchSignInMethodsForEmail(
        email,
      );

      if (signInMethods.contains('google')) {
        throw AuthException(
          message: 'Tipo de login inválido para redefinir senha',
        );
      } else {
        await _firebaseAuth.sendPasswordResetEmail(email: email);
      }
    } on PlatformException catch (e, s) {
      debugPrint('🐞 PlatformException: $e, Stacktrace: $s');
      throw AuthException(message: 'Erro ao redefinir sua senha');
    }
  }

  @override
  Future<User?> signInWithGoogle() async {
    try {
      final googleSignIn = GoogleSignIn();
      final googleAccount = await googleSignIn.signIn();

      if (googleAccount == null) {
        throw AuthException(message: 'Login cancelado');
      }

      final signInMethods = await _firebaseAuth.fetchSignInMethodsForEmail(
        googleAccount.email,
      );

      if (signInMethods.contains('password')) {
        throw AuthException(
          message: 'Este e-mail já está em uso, faça login com e-mail e senha',
        );
      }

      final googleAuth = await googleAccount.authentication;

      if (googleAuth.idToken == null && googleAuth.accessToken == null) {
        throw AuthException(message: 'Erro ao fazer login com o Google');
      }

      final userCredentials = await _firebaseAuth.signInWithCredential(
        GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        ),
      );

      return userCredentials.user;
    } on FirebaseAuthException catch (e, s) {
      debugPrint('🐞 FirebaseAuthException: $e, Stacktrace: $s');

      if (e.code == 'account-exists-with-different-credential') {
        throw AuthException(
          message: 'Este e-mail já está em uso, faça login com e-mail e senha',
        );
      }

      throw AuthException(message: 'Erro ao fazer login com o Google');
    } on PlatformException catch (e, s) {
      debugPrint('🐞 PlatformException: $e, Stacktrace: $s');
      throw AuthException(message: 'Erro ao realizar login com o Google');
    }
  }

  @override
  Future<void> logout() async {
    await GoogleSignIn().signOut();
    return _firebaseAuth.signOut();
  }

  @override
  Future<void> updateProfileName(String name) async {
    final user = _firebaseAuth.currentUser;

    if (user == null) {
      throw AuthException(message: 'Usuário não autenticado');
    }

    await user.updateDisplayName(name);

    return user.reload();
  }
}
