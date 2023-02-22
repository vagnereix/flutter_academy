void main() {
  print('Inicio da funcão main.');

  final future_1 = funcao_1();
  final future_2 = funcaoSimilarFuncao_1();

  future_1.then(print);
  future_2.then(print);

  print('Fim da funcão main.');
}

Future<String> funcao_1() async {
  return 'Retorno da função 1.';
}

Future<String> funcaoSimilarFuncao_1() {
  return Future.value('Retorno igual ao da função 1.');
}
