import 'dart:convert';

import 'package:_dart_api_consum/2_consumindo_api/models/aluno.dart';
import 'package:http/http.dart';

class AlunoRepository {
  Future<List<Aluno>> findAll() async {
    final response = await get(Uri.parse('http://localhost:8080/alunos'));

    final alunosList = jsonDecode(response.body);

    return alunosList.map<Aluno>((aluno) => Aluno.fromMap(aluno)).toList();
  }

  Future<Aluno> findById(int id) async {
    final response = await get(Uri.parse('http://localhost:8080/alunos/$id'));

    return Aluno.fromJson(response.body);
  }
}
