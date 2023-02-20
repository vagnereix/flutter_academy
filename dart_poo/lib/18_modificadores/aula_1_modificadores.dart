void main() {
  var pessoa_1 = const Pessoa(nome: 'Vagner', idade: 24);
  var pessoa_2 = const Pessoa(nome: 'Vagner', idade: 24);

  print(pessoa_1 == pessoa_2);
}

class Pessoa {
  final String nome;
  final int idade;

  const Pessoa({
    required this.nome,
    required this.idade,
  });
}
