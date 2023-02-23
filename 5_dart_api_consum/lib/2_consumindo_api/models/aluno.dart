// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'curso.dart';
import 'endereco.dart';

class Aluno {
  final int id;
  final String nome;
  final int? idade;
  final List<String> nomeCursos;
  final List<Curso> cursos;
  final Endereco endereco;

  Aluno({
    required this.id,
    required this.nome,
    this.idade,
    required this.nomeCursos,
    required this.cursos,
    required this.endereco,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'id': id,
      'nome': nome,
      'idade': idade,
      'nomeCursos': nomeCursos,
      'cursos': cursos.map((x) => x.toMap()).toList(),
      'endereco': endereco.toMap(),
    };

    if (idade != null) {
      map['idade'] = idade;
    }

    return map;
  }

  factory Aluno.fromMap(Map<String, dynamic> map) {
    return Aluno(
      id: map['id'] as int,
      nome: map['nome'] as String,
      idade: map['idade'] != null ? map['idade'] as int : null,
      nomeCursos: List<String>.from((map['nomeCursos'] as List<dynamic>)),
      cursos: List<Curso>.from(
        (map['cursos'] as List<dynamic>).map<Curso>(
          (x) => Curso.fromMap(x as Map<String, dynamic>),
        ),
      ),
      endereco: Endereco.fromMap(map['endereco'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Aluno.fromJson(String source) =>
      Aluno.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Aluno(id: $id, nome: $nome, idade: $idade, nomeCursos: $nomeCursos, cursos: $cursos, endereco: $endereco)';
  }
}
