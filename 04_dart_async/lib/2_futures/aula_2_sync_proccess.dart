void main() {
  print('Inicio.');

  funcao_1();
  funcao_2();

  print('Fim.');
}

void funcao_1() {
  print('Executando função 1.');
  Future.delayed(Duration(seconds: 2), () => print('Execução complexa 1.'));
}

void funcao_2() {
  print('Executando função 2.');
  Future.delayed(Duration(seconds: 1), () => print('Execução complexa 2.'));
}
