void main() {
  () {
    print('Função anônima.');
  }();

  funcaoArrow();

  funcaoComCallback((a, b) => print(a + b));

  funcaoComCallbackTypedef((a, b) => print(a + b));
}

void funcaoArrow() => print('Função arrow.');

void funcaoComCallback(void Function(int a, int b) funcaoSoma) {
  funcaoSoma(1, 1);
}

typedef TypeFucaoSoma = void Function(int a, int b);

void funcaoComCallbackTypedef(TypeFucaoSoma funcaoSoma) {
  funcaoSoma(1, 1);
}
