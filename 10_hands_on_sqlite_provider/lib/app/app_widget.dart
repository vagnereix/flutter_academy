import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'core/database/sqlite_adm_connection.dart';
import 'core/ui/ui_config.dart';
import 'modules/auth/auth_module.dart';
import 'modules/splash/splash_page.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final sqliteAdmConnection = SqliteAdmConnection();

  @override
  void initState() {
    super.initState();
    FirebaseAuth auth = FirebaseAuth.instance;
    print('authenticated user: ${auth.currentUser?.uid}');
    WidgetsBinding.instance.addObserver(sqliteAdmConnection);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(sqliteAdmConnection);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        title: 'Todo List App',
        theme: UiConfig.theme,
        home: const SplashPage(),
        initialRoute: '/login',
        routes: {
          ...AuthModule().routes,
        },
      ),
    );
  }
}
