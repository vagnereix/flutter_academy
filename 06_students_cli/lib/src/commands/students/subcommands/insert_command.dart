import 'dart:io';

import 'package:_students_cli/src/models/address.dart';
import 'package:_students_cli/src/models/city.dart';
import 'package:_students_cli/src/models/phone.dart';
import 'package:_students_cli/src/models/student.dart';
import 'package:_students_cli/src/repositories/product_repository.dart';
import 'package:args/command_runner.dart';

import '../../../repositories/student_repository.dart';

class InsertCommand extends Command {
  final StudentRepository studentRepository;
  final productRepository = ProductRepository();

  InsertCommand({
    required this.studentRepository,
  }) {
    argParser.addOption('file', help: 'CSV file path to insert.', abbr: 'f');
  }

  @override
  String get description => 'Insert one or more new students';

  @override
  String get name => 'insert';

  @override
  Future<void> run() async {
    final filePath = argResults?['file'];

    if (filePath == null) {
      print('-----------------------------------------------');
      print('Por favor, forneça o caminho do arquivo CSV.');
      print('-----------------------------------------------');

      return;
    }

    print('Lendo dados do arquivo...');
    try {
      final students = File(filePath).readAsLinesSync();

      for (var student in students) {
        final data = student.split(';');

        final coursesFutureList = data[2].split(',').map((e) async {
          final c = await productRepository.findByName(e.trim());
          return c.copyWith(isStudent: true);
        }).toList();

        final courses = await Future.wait(coursesFutureList);

        final studentModel = Student(
          name: data[0],
          age: int.tryParse(data[1]),
          nameCourses: data[2].split(',').map((e) => e.trim()).toList(),
          courses: courses,
          address: Address(
            street: data[3],
            number: int.parse(data[4]),
            zipCode: data[5],
            city: City(id: 1, name: data[6]),
            phone: Phone(ddd: int.parse(data[7]), phone: data[8]),
          ),
        );

        studentRepository.insert(studentModel);
      }

      print('---------------------------------');
      print('Alunos adicionados com sucesso.');
      print('---------------------------------');
    } catch (e) {
      print('----------------------------------------------');
      print('O sistema não pôde ler o arquivo especificado.');
      print('----------------------------------------------');
    }
  }
}
