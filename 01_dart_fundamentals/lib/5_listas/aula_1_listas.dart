void main() {
  List lista = [1, 'Vagner', 2.4];

  List<num> listaDeNumeros = [1, 2, 3.5, 4.2];
  List<int> listaDeNumerosVazia = [];

  var listaDeNums = <num>[1, 3.52];
  var listaDeNumsVazia = <int>[];

  // Dessa forma o tipo da lista será definido para dynamic.
  var listaInicializadaErroneamente = [];

  print(
    '$lista, $listaInicializadaErroneamente, $listaDeNumeros, $listaDeNumerosVazia, $listaDeNums, $listaDeNumsVazia',
  );
}
