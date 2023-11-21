import 'package:flutter/material.dart';

import 'core/database/sqlite_adm_connection.dart';
import 'core/navigator/app_navigator.dart';
import 'core/ui/ui_config.dart';
import 'modules/auth/auth_module.dart';
import 'modules/home/home_module.dart';
import 'modules/splash/splash_page.dart';
import 'modules/tasks/tasks_module.dart';

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
        debugShowCheckedModeBanner: false,
        title: 'Todo List App',
        theme: UiConfig.theme,
        home: const SplashPage(),
        navigatorKey: AppNavigator.navigatorKey,
        routes: {
          ...AuthModule().routes,
          ...HomeModule().routes,
          ...TasksModule().routes,
        },
      ),
    );
  }
}
