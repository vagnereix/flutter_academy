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

  final listaBidimensional = [
    [1, 2],
    [3, 4],
  ];

  // Gera uma nova lista única a partir de uma lista Bidimensional.
  final novaLista = listaBidimensional.expand((numeros) => numeros).toList();
  print(novaLista);

  final pacientes = [
    'Rodrigo Rahman | 35 | desenvolvedor | SP',
    'João Rahman | 55 | jornalista | SP',
    'Vagner Reis | 24 | Desenvolvedor | CE',
  ];

  if (pacientes.any((paciente) => paciente.contains('Vagner'))) {
    print('Contém Vagner na lista.');
  }

  if (pacientes.every((paciente) => paciente.contains('V'))) {
    print('Todos os items contém a letra V.');
  } else {
    print('Nem todos os items contém a letra V.');
  }

  // Nesse caso, ordena a lista por odem alfabética pois o primeiro
  // caractere de cada elemento é uma String.
  pacientes.sort();
  print(pacientes);

  // Passando um função de Callback para ordernar pela idade do paciente.
  // Utilizar esse tipo de ordenação para ordenações mais específicas.
  pacientes.sort((primeiroPaciente, segundoPaciente) {
    final a = int.parse(primeiroPaciente.split('|')[1]);
    final b = int.parse(segundoPaciente.split('|')[1]);

    if (a > b) return 1;
    if (a == b) return 0;
    return -1;
  });

  print(pacientes);

  // Mesmo comportamendo da função de Callback anterior utilizando .compareTo().
  pacientes.sort((primeiroPaciente, segundoPaciente) {
    final a = int.parse(primeiroPaciente.split('|')[1]);
    final b = int.parse(segundoPaciente.split('|')[1]);

    return a.compareTo(b);
  });

  print(pacientes);
}
