void main() async {
  print('Inicio da funcão main.');

  final nomes = ['Vagner', 'Queiroz', 'Reix'];
  for (var nome in nomes) {
    print(await saudacao(nome));
  }

  await Future.forEach<String>(
    nomes,
    (nome) async => print(
      await saudacao(nome),
    ),
  );

  final nomesList = nomes.map((nome) => saudacao(nome)).toList();
  await Future.wait(nomesList).then(print);

  print('Fim da funcão main.');
}

Future<String> saudacao(String nome) async {
  return Future.delayed(Duration(seconds: 1), () => 'Olá $nome');
}
