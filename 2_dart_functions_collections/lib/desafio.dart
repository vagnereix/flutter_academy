void main() {
  // A String é composta por 3 campos (Nome|Idade|Sexo)
  final pessoas = [
    'Rodrigo Rahman|35|Masculino',
    'Jose|56|Masculino',
    'Joaquim|84|Masculino',
    'Rodrigo Rahman|35|Masculino',
    'Maria|88|Feminino',
    'Helena|24|Feminino',
    'Leonardo|5|Masculino',
    'Laura Maria|29|Feminino',
    'Joaquim|72|Masculino',
    'Helena|24|Feminino',
    'Guilherme|15|Masculino',
    'Manuela|85|Feminino',
    'Leonardo|5|Masculino',
    'Helena|24|Feminino',
    'Laura|29|Feminino',
  ];

  // 1 - Remova os pacientes duplicados e apresente a nova lista
  final pessoasSemRepeticoes =
      pessoas.toSet().map((pessoa) => pessoa.split('|')).toList();

  print('Pessoas sem repetição de nomes:');
  for (var pessoa in pessoasSemRepeticoes) {
    print(pessoa[0]);
  }

  // 2 - Me mostre a quantidade de pessoas por sexo (Masculino e Feminino) e depois me apresente o nome delas
  final pessoasPorSexo = <String, List<String>>{};
  for (var pessoa in pessoasSemRepeticoes) {
    if (pessoa[2].toLowerCase() == 'masculino') {
      pessoasPorSexo.update(
        'M',
        (value) => [...value, pessoa[0]],
        ifAbsent: () => [pessoa[0]],
      );
    }

    if (pessoa[2].toLowerCase() == 'feminino') {
      pessoasPorSexo.update(
        'F',
        (value) => [...value, pessoa[0]],
        ifAbsent: () => [pessoa[0]],
      );
    }
  }

  print(
    'Quantidade de pessoas do sexo Masculino: ${pessoasPorSexo['M']?.length}. São elas:',
  );
  pessoasPorSexo['M']?.forEach(print);

  print(
    'Quantidade de pessoas do sexo Feminino: ${pessoasPorSexo['F']?.length}. São elas:',
  );
  pessoasPorSexo['F']?.forEach(print);

  // 3 - Filtrar e deixar a lista somente com pessoas maiores de 18 anos e apresente essas pessoas pelo nome
  final pessoasMaioresDeDezoito = pessoasSemRepeticoes.where((pessoa) {
    final idadePessoa = int.parse(pessoa[1]);

    return idadePessoa > 18;
  }).toList();

  print('Pessoas maiores de dezoito anos:');
  for (var pessoa in pessoasMaioresDeDezoito) {
    print(pessoa[0]);
  }

  // 4 - Encontre a pessoa mais velha e apresente o nome dela.
  final pessoasSemRepeticoesOrdenadasPorIdade = [...pessoasSemRepeticoes];

  pessoasSemRepeticoesOrdenadasPorIdade.sort((primeiraPessoa, segundaPessoa) {
    final idadePrimeiraPessoa = int.parse(primeiraPessoa[1]);
    final idadeSegundaPessoa = int.parse(segundaPessoa[1]);

    return idadeSegundaPessoa.compareTo(idadePrimeiraPessoa);
  });

  print(
    '${pessoasSemRepeticoesOrdenadasPorIdade.first[0]} é a pessoa mais velha com ${pessoasSemRepeticoesOrdenadasPorIdade.first[1]} anos de idade.',
  );
  print(
    '${pessoasSemRepeticoesOrdenadasPorIdade.last[0]} é a pessoa mais nova com ${pessoasSemRepeticoesOrdenadasPorIdade.last[1]} anos de idade.',
  );
}
