import 'dart:convert';

import 'package:_students_cli/src/models/course.dart';
import 'package:http/http.dart';

class ProductRepository {
  Future<Course> findByName(String name) async {
    final response = await get(
      Uri.parse('http://localhost:8080/products?name=$name'),
    );

    if (response.statusCode != 200) throw Exception('Erro ao buscar produto.');

    final List<dynamic> coursesList = json.decode(response.body);

    if (coursesList.isEmpty) throw Exception('Nenhum produto encontrado.');

    return Course.fromMap(coursesList.first);
  }
}
