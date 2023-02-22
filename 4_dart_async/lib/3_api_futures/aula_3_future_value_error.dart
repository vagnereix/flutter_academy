void main() {
  print('Inicio da funcão main.');

  Future.value('Completo com sucesso.');
  Future.error('Completo com erro.');

  print('Fim da funcão main.');
}

Future<String> funcao_1() async {
  return 'Retorno da função 1.';
}

Future<String> funcaoSimilarFuncao_1() {
  return Future.value('Retorno da função 1.');
}
