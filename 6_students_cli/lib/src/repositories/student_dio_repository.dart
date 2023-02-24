import 'package:_students_cli/src/models/student.dart';
import 'package:dio/dio.dart';

class StudentDioRepository {
  Future<List<Student>> findAll() async {
    try {
      final response = await Dio().get('http://localhost:8080/students');

      final List<dynamic> coursesList = response.data;
      if (coursesList.isEmpty) throw Exception('Nenhum estudante encontrado.');

      return coursesList
          .map<Student>((student) => Student.fromMap(student))
          .toList();
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Student> findById(int id) async {
    try {
      final response = await Dio().get('http://localhost:8080/students/$id');

      final student = response.data;
      if (student.isEmpty) throw Exception('Estudante não encontrado.');

      return Student.fromMap(student);
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> insert(Student student) async {
    try {
      await Dio().post(
        'http://localhost:8080/students',
        data: student.toMap(),
      );
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> update(Student student) async {
    try {
      await Dio().put(
        'http://localhost:8080/students/${student.id}',
        data: student.toMap(),
      );
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> deletebyId(int id) async {
    try {
      await Dio().delete('http://localhost:8080/students/$id');
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }
}
