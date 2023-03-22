import 'package:flutter/material.dart';

class Images extends StatelessWidget {
  const Images({super.key});

  @override
  Widget build(BuildContext context) {
    print('Densidade de pixels: ${MediaQuery.of(context).devicePixelRatio}');

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Images',
          style: TextStyle(fontFamily: 'Raleway'),
        ),
        backgroundColor: Colors.purple[800],
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.of(context).pushAndRemoveUntil(
              //   MaterialPageRoute(
              //     settings: const RouteSettings(name: 'Home page'),
              //     builder: (context) => const HomePage(),
              //   ),
              //   ModalRoute.withName('Containers page'),
              // );
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/images',
                ModalRoute.withName('/'),
              );
            },
            icon: const Icon(Icons.backspace_outlined),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 300,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.asset(
                  'assets/jett.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: 300,
              height: 300,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                image: DecorationImage(
                  image: NetworkImage('https://github.com/vagnereix.png'),
                ),
              ),
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Imagem como background.',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
