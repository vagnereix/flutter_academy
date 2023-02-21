void main() {
  print(
    'Soma com parâmetros obrigatórios: ${somaComParametrosObrigatorios(1, 2)}',
  );
  print(
    'Soma com parâmetros nomeados podendo receber nullos: ${somaComParametrosNomeados(a: null, b: 2)}',
  );
  print(
    'Soma opcional com parâmetros nomeados: ${somaOpcionalComParametrosNomeados()}',
  );
  print(
    'Soma opcional com parâmetros opcionais: ${somaOpcionalComParametrosOpcionais()}',
  );
  print(
    'Soma parâmetro obrigatório com nomeado: ${somaParametroObrigatorioComNomeado(1, b: 2)}',
  );
  print(
    'Soma parâmetro obrigatório com opcional: ${somaParametroObrigatorioComOpcional(1)}',
  );
}

int somaComParametrosObrigatorios(int a, int b) {
  return a + b;
}

int somaComParametrosNomeados({required int? a, required int b}) {
  a ??= 0; // Atribuindo o valor 0 caso o parâmetro 'a' seja nulo.
  return a + b;
}

int somaOpcionalComParametrosNomeados({
  int a = 1,
  int b = 2,
}) {
  return a + b;
}

int somaOpcionalComParametrosOpcionais([int a = 1, int b = 2]) {
  return a + b;
}

int somaParametroObrigatorioComNomeado(int a, {required int b}) {
  return a + b;
}

int somaParametroObrigatorioComOpcional(int a, [int b = 2]) {
  return a + b;
}
