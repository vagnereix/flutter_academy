void main() {
  print('Inicio da funcão main.');

  Future<String>(() {
    return 'Future normal.';
  }).then(print);

  Future<String>.sync(() {
    print('Função sendo executada junto ao Event Loop da main.');

    return 'Resultado da Future.';
  }).then(print);

  Future<String>.microtask(() {
    return 'Future microtask.';
  }).then(print);

  print('Fim da funcão main.');
}
