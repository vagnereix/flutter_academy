import 'package:_flutter_provider/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    debugPrint('Rebuilding HomePage');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<HomeController>(
            builder: (context, controller, child) {
              debugPrint('Rebuilding name Consumer');

              return Text(controller.user.name);
            },
          ),
          const SizedBox(
            height: 200,
          ),
          Selector<HomeController, String>(
            selector: (context, controller) => controller.user.ocupation,
            builder: (context, ocupation, child) {
              debugPrint('Rebuilding ocupation Selector');

              return Text(ocupation);
            },
          ),
          const SizedBox(
            height: 200,
          ),
          Selector<HomeController,
              Tuple2<void Function(String), void Function(String)>>(
            selector: (context, controller) {
              return Tuple2(controller.changeName, controller.changeOcupation);
            },
            builder: (context, tuple, child) {
              debugPrint('Rebuilding HomeController Consumer');

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => tuple.item1('Dos Reis, Vagner'),
                    child: const Text('Change user name'),
                  ),
                  ElevatedButton(
                    onPressed: () => tuple.item2('Software Engineer'),
                    child: const Text('Change ocupation'),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
