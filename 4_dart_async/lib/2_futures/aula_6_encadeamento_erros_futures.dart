void main() {
  funcao_1()
      .then((value) => funcao_2(), onError: (error) {
        print('Erro na função 1.');
      })
      .then(
        (value) => print(value),
        onError: (error) {
          print('Tratando erro na função 2: $error');

          return funcao_3();
        },
      )
      .then(print)
      .catchError((error) {
        print('Erro em alguma função.');
      });
}

Future<String> funcao_1() {
  return Future.value('Funcão 1 executada com sucesso.');
}

Future<String> funcao_2() {
  return Future.error('Funcão 2 com erro 0x1283123.');
}

Future<String> funcao_3() {
  return Future.value('Funcão 3 executada com sucesso.');
}
