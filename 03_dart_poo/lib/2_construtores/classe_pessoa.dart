class Pessoa {
  String? nome;
  int? idade;
  String? sexo;

  // Construtor default
  Pessoa({
    required this.nome,
    required this.idade,
    required this.sexo,
  });

  // Construtor nomeado
  Pessoa.semNome({
    required this.idade,
    required this.sexo,
  });

  Pessoa.vazia();

  // Construtor factory
  factory Pessoa.fabrica({required String nomeFactory}) {
    var nome = '${nomeFactory}_factory';
    var pessoa = Pessoa.vazia();

    pessoa.nome = nome;
    return pessoa;
  }
}
