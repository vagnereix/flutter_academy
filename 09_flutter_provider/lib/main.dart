import 'package:_flutter_provider/controllers/home_controller.dart';
import 'package:_flutter_provider/controllers/products_controller.dart';
import 'package:_flutter_provider/pages/home_page.dart';
import 'package:_flutter_provider/pages/products_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeController>(
          create: (context) => HomeController(),
        ),
        Provider(
          create: (context) => ProductsController(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Provider',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Provider'),
          ),
          body: Builder(
            builder: (context) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      child: const Text('Home'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/products');
                      },
                      child: const Text('Products'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        routes: {
          '/home': (context) => const HomePage(),
          '/products': (context) => const ProductsPage(),
        },
      ),
    );
  }
}
