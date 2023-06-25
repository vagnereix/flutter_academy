void main() {
  final lista = <int?>[];
  final set = <int?>{};

  lista.add(1);
  lista.add(1);
  lista.add(2);
  lista.add(5);
  lista.add(null);

  set.add(1);
  set.add(1);
  set.add(2);
  set.add(3);
  set.add(null);

  print(lista);
  print(set);

  final listaSet = lista.toSet();
  print(listaSet);

  // O que tem na 'listaSet' que não tem na 'set'.
  print(listaSet.difference(set));

  // O que tem na 'set' que não tem na 'listaSet'.
  print(set.difference(listaSet));

  print(set.union(listaSet));

  // O que tem nos dois Sets.
  print(set.intersection(listaSet));
}
