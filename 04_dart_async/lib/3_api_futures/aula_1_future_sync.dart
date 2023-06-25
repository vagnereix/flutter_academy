void main() {
  print('Inicio da funcão main.');

  Future<String>.sync(() {
    print('Função sendo executada junto ao Event Loop da main.');

    return 'Resultado da Future.';
  }).then(print);

  print('Fim da funcão main.');
}
