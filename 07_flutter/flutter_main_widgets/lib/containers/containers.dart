// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Containers extends StatefulWidget {
  final String paramString;

  const Containers({
    Key? key,
    required this.paramString,
  }) : super(key: key);

  @override
  State<Containers> createState() => _ContainersState();
}

class _ContainersState extends State<Containers> {
  int? id;

  @override
  void initState() {
    super.initState();

    // Necessário pois só conseguimos acessar o build context após a página estar montada
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final param =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

      setState(() {
        id = param?['id'] ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // final param =
    //     ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Containers'),
        backgroundColor: Colors.purple[800],
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     settings: const RouteSettings(name: 'Images page'),
              //     builder: (context) => const Images(),
              //   ),
              // );
              Navigator.of(context).pushReplacementNamed('/images');
            },
            icon: const Icon(Icons.image),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).popAndPushNamed('/images');
            },
            icon: const Icon(Icons.back_hand_outlined),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pop(
                'Messagem enviada de volta pela Containers Page.',
              );
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ],
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade600,
                blurRadius: 15,
                offset: const Offset(10, 10),
              ),
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 20,
                offset: const Offset(5, 5),
              ),
            ],
          ),
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Container personalizado com param $id.',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              Text(
                'Parâmetro string ${widget.paramString}.',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
