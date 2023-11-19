import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_widget.dart';
import 'core/auth/app_auth_provider.dart';
import 'core/database/sqlite_connection_factory.dart';
import 'repositories/user/user_repository.dart';
import 'repositories/user/user_repository_impl.dart';
import 'services/user/user_service.dart';
import 'services/user/user_service_impl.dart';

// Todas as classes compartilhadas por todos os outros módulos ficam aqui
class AppModule extends StatelessWidget {
  const AppModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => FirebaseAuth.instance),
        Provider(
          create: (_) => SqliteConnectionFactory.instance,
          lazy: false,
        ),
        Provider<UserRepository>(
          create: (context) => UserRepositoryImpl(
            firebaseAuth: context.read<FirebaseAuth>(),
          ),
        ),
        Provider<UserService>(
          create: (context) => UserServiceImpl(
            userRepository: context.read<UserRepository>(),
          ),
        ),
        ChangeNotifierProvider<AppAuthProvider>(
          create: (context) => AppAuthProvider(
            firebaseAuth: context.read<FirebaseAuth>(),
            userService: context.read<UserService>(),
          )..loadListener(),
          lazy: false,
        ),
      ],
      child: const AppWidget(),
    );
  }
}
