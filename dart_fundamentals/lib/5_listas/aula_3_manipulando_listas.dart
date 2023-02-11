void main() {
  final nomes = ['Vagner'];
  print(nomes);

  nomes.add('Queiroz');
  print(nomes);

  nomes.addAll(['Dos', 'Reis']);
  print(nomes);

  nomes.insert(0, 'Antonio');
  print(nomes);

  nomes.remove('Antonio');
  print(nomes);

  print(nomes.first);
  print(nomes.last);

  nomes.removeWhere((nome) => nome == 'Dos');
  print(nomes);

  nomes.removeAt(1);
  print(nomes);

  nomes.removeRange(0, 2);
  print(nomes);

  final listaGeradaPeloGenerate = List.generate(5, (index) => index + 1);
  print(listaGeradaPeloGenerate);

  final listaGeradaPeloFilled = List.filled(5, 'V');
  print(listaGeradaPeloFilled);

  final soma = listaGeradaPeloGenerate.fold(
    0,
    (previousValue, numero) => previousValue += numero,
  );
  print(soma);

  // Colletion if
  final condicao = true;
  final listaColletionIf = [if (condicao) 'Lista não vazia'];
  print(listaColletionIf); // [Lista não vazia]

  // Colletion for
  final listaColletionFor = [
    for (var i in listaGeradaPeloGenerate) 'Elemento $i'
  ];
  print(listaColletionFor);
}
