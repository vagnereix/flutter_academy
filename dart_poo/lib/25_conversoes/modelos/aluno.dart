// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dart_poo/25_conversoes/modelos/curso.dart';
import 'package:dart_poo/25_conversoes/modelos/endereco.dart';

class Aluno {
  final String nome;
  final Endereco endereco;
  final List<Curso> cursos;

  Aluno({
    required this.nome,
    required this.endereco,
    required this.cursos,
  });

  @override
  String toString() =>
      'Aluno(nome: $nome, endereco: $endereco, cursos: $cursos)';
}
