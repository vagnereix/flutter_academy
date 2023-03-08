import 'dart:async';

Future<void> main() async {
  final streamController = StreamController<Pessoa>.broadcast();

  final inStream = streamController.sink;
  final outStream = streamController.stream;

  outStream
      .map((pessoa) => 'A idade da pessoa é ${pessoa.idade}.')
      .listen(print);

  var numeros = List.generate(5, (index) => index);

  for (var numero in numeros) {
    inStream.add(Pessoa(idade: numero));
  }

  await streamController.close();
}

class Pessoa {
  final int idade;

  Pessoa({
    required this.idade,
  });
}
