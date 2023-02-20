class Pessoa {
  final String nome;

  // Composição
  final IDPessoal cpf;
  final Endereco endereco;

  // Agregação
  final Telefone celular;

  Pessoa({
    required this.nome,
    required this.cpf,
    required this.endereco,
    required this.celular,
  });
}

class IDPessoal {}

class Endereco {}

class Telefone {}
