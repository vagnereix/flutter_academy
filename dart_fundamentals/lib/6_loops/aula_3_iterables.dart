void main() {
  final numeros = List.generate(5, (index) => index + 1);

  // Filtrando os elementos.
  numeros
      .where(
        (numero) => numero != 3,
      )
      .forEach(print);

  final numerosMenoresQueCincoSemOTres = numeros
      .takeWhile(
        (numero) => numero < 5,
      )
      .where((numero) => numero != 3)
      .toList();

  print(numerosMenoresQueCincoSemOTres);

  final numerosMaioresQueTres = numeros
      .skipWhile(
        (numero) => numero <= 3,
      )
      .toList();

  print(numerosMaioresQueTres);

  final listandoNumerosComoStrings = numeros.map((numero) {
    return 'Número $numero';
  }).toList();

  print(listandoNumerosComoStrings);
}
