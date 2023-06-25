import 'package:flutter/material.dart';
import 'package:flutter_main_widgets/containers/containers.dart';
import 'package:flutter_main_widgets/core/navigator_observer_custom.dart';
import 'package:flutter_main_widgets/home/home_page.dart';
import 'package:flutter_main_widgets/images/images.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        // '/': (context) => const HomePage(),
        // '/containers': (context) => const Containers(),
        '/images': (context) => const Images(),
      },
      navigatorObservers: [
        NavigatorObserverCustom(),
      ],
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(
            settings: settings,
            builder: (context) => const HomePage(),
          );
        }
        if (settings.name == '/containers') {
          final param = settings.arguments as Map<String, dynamic>?;

          return MaterialPageRoute(
            settings: settings,
            builder: (context) => Containers(
              paramString: param?['string'] ?? 'Parâmetro não enviado.',
            ),
          );
        }

        return null;
      },
    );
  }
}
