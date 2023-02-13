enum Cores {
  red,
  green,
  blue,
}

void main() {
  print(Cores.red.name);

  final redFromEnum = Cores.values.byName('red');
  print(redFromEnum);

  final mapFromEnum = Cores.values.asMap();
  print(mapFromEnum);

  final nameMapFromEnum = Cores.values.asNameMap();
  print(nameMapFromEnum);

  // Retorna null ao não encontrar, enquando o byName gera uma excessão.
  final blueFromNameMapFromEnum = nameMapFromEnum['blue'];
  print(blueFromNameMapFromEnum);
}
