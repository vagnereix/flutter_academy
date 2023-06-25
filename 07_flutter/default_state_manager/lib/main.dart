import 'package:default_state_manager/pages/home_page.dart';
import 'package:default_state_manager/pages/imc_bloc_pattern/imc_bloc_pattern_page.dart';
import 'package:default_state_manager/pages/imc_change_notifier/imc_change_notifier_page.dart';
import 'package:default_state_manager/pages/imc_inherited_notifier/imc_inherited_notifier.dart';
import 'package:default_state_manager/pages/imc_inherited_notifier/imc_inherited_notifier_page.dart';
import 'package:default_state_manager/pages/imc_inherited_widget/imc_inherited_widget.dart';
import 'package:default_state_manager/pages/imc_inherited_widget/imc_inherited_widget_page.dart';
import 'package:default_state_manager/pages/imc_set_state_page.dart';
import 'package:default_state_manager/pages/imc_value_notifier_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ImcInheritedWidget(
      imc: 24,
      child: ImcInheritedNotifier(
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            appBarTheme: const AppBarTheme(
              elevation: 0,
            ),
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const HomePage(),
            '/set_state': (context) => const ImcSetStatePage(),
            '/value_notifier': (context) => const ImcValueNotifierPage(),
            '/change_notifier': (context) => const ImcChangeNotifierPage(),
            '/bloc_pattern': (context) => const ImcBlocPatternPage(),
            '/inherited_widget': (context) => const ImcInheritedWidgetPage(),
            '/inherited_notifier': (_) => const ImcInheritedNotifierPage(),
          },
        ),
      ),
    );
  }
}
