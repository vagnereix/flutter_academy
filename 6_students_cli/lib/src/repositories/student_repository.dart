import 'dart:convert';

import 'package:_students_cli/src/models/student.dart';
import 'package:http/http.dart';

class StudentRepository {
  Future<List<Student>> findAll() async {
    final response = await get(Uri.parse('http://localhost:8080/students'));

    if (response.statusCode != 200) {
      throw Exception('Erro ao buscar estudantes.');
    }

    final List<dynamic> coursesList = json.decode(response.body);

    if (coursesList.isEmpty) throw Exception('Nenhum estudante encontrado.');

    return coursesList
        .map<Student>((student) => Student.fromMap(student))
        .toList();
  }

  Future<Student> findById(int id) async {
    final response = await get(Uri.parse('http://localhost:8080/students/$id'));

    if (response.statusCode != 200) {
      throw Exception('Erro ao busca estudante.');
    }

    final student = json.decode(response.body);

    if (student.isEmpty) throw Exception('Estudante não encontrado.');

    return Student.fromMap(student);
  }

  Future<void> insert(Student student) async {
    final response = await post(
      Uri.parse('http://localhost:8080/students'),
      body: student.toJson(),
      headers: {
        'Content-Type': 'application/json', // Só é necessário por conta da lib
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Erro ao inserir estudante.');
    }
  }

  Future<void> update(Student student) async {
    final response = await put(
      Uri.parse('http://localhost:8080/students/${student.id}'),
      body: student.toJson(),
      headers: {
        'Content-Type': 'application/json', // Só é necessário por conta da lib
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Erro ao editar estudante.');
    }
  }

  Future<void> deletebyId(int id) async {
    final response = await delete(
      Uri.parse('http://localhost:8080/students/$id'),
    );

    if (response.statusCode != 200) {
      throw Exception('Erro ao deletar estudante.');
    }
  }
}
