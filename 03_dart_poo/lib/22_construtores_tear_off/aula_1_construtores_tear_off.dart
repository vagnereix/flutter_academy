// ignore_for_file: public_member_api_docs, sort_constructors_first
void main() {
  final nomes = ['Vagner', 'Reis'];

  final pessoas = nomes.map((nome) => Pessoa(nome)).toList();
  final pessoasTearOff = nomes.map<Pessoa>(Pessoa.nome).toList();

  pessoas.forEach(print);
  pessoasTearOff.forEach(print);
}

class Pessoa {
  String nome;

  Pessoa(this.nome);

  Pessoa.nome(this.nome);

  @override
  String toString() => 'Pessoa(nome: $nome)';
}
