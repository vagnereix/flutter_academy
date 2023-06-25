import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha AppBar'),
        backgroundColor: Colors.purple[800],
        actions: [
          IconButton(
            onPressed: () async {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     settings: const RouteSettings(name: 'Containers page'),
              //     builder: (context) => const Containers(),
              //   ),
              // );
              var message = await Navigator.of(context).pushNamed(
                '/containers',
                arguments: {'id': 1, 'string': 'Vagner'},
              );

              print(message);
            },
            icon: const Icon(Icons.square_rounded),
          ),
        ],
      ),
      endDrawer: const Drawer(
        child: Center(
          child: Text('Menu lateral à esquerda simples de fazer.'),
        ),
      ),
      body: const SafeArea(
        child: Center(
          child: Text('Home Page personalizada.'),
        ),
      ),
    );
  }
}
