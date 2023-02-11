void main() {
  final idade = 24;

  print('Idade: ${idade.toString()}');
  if (idade.isNegative) print('Idade inválida.');

  final doubleValor = 10.7682932;

  print(doubleValor.round());
  print(doubleValor.roundToDouble());

  final stringValor = '12';
  final stringValorErroneo = '12,';

  print(int.parse(stringValor)); // Exception no caso de erro.
  print(int.tryParse(stringValorErroneo)); // null no caso de erro.

  print(doubleValor.toStringAsFixed(2));
}
