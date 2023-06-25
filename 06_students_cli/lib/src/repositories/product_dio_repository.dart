import 'package:_students_cli/src/models/course.dart';
import 'package:dio/dio.dart';

class ProductDioRepository {
  Future<Course> findByName(String name) async {
    try {
      final response =
          await Dio().get('http://localhost:8080/products?name=$name');

      if (response.data.isEmpty) throw Exception('Nenhum produto encontrado.');

      return Course.fromMap(response.data.first);
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }
}
