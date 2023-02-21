import 'package:dart_poo/2_construtores/classe_pessoa.dart';

void main() {
  var pessoa = Pessoa(nome: 'Vagner', idade: 24, sexo: 'M');

  print(pessoa.nome);

  var pessoaSemNome = Pessoa.semNome(idade: 24, sexo: 'M');
  var pessoaVazia = Pessoa.vazia();
  var pessoaFabrica = Pessoa.fabrica(nomeFactory: 'Vagner');

  print(pessoaSemNome.sexo);
  print(pessoaVazia.nome);
  print(pessoaFabrica.nome);
}
