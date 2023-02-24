import 'dart:io';

import 'package:_students_cli/src/models/address.dart';
import 'package:_students_cli/src/models/city.dart';
import 'package:_students_cli/src/models/phone.dart';
import 'package:_students_cli/src/models/student.dart';
import 'package:_students_cli/src/repositories/product_repository.dart';
import 'package:args/command_runner.dart';

import '../../../repositories/student_repository.dart';

class UpdateCommand extends Command {
  final StudentRepository studentRepository;
  final productRepository = ProductRepository();

  UpdateCommand({
    required this.studentRepository,
  }) {
    argParser.addOption(
      'file',
      help: 'CSV file path to get updated data.',
      abbr: 'f',
    );
    argParser.addOption('id', help: 'Id of user to update.', abbr: 'i');
  }

  @override
  String get description => 'Update one student';

  @override
  String get name => 'update';

  @override
  Future<void> run() async {
    final filePath = argResults?['file'];
    final argId = argResults?['id'];

    if (filePath == null) {
      print('--------------------------------------------');
      print('Por favor, forneça o caminho do arquivo CSV.');
      print('--------------------------------------------');

      return;
    }

    final students = File(filePath).readAsLinesSync();

    if (students.length > 1) {
      print(
        '--------------------------------------------------------------------------------------',
      );
      print(
        'O arquivo informado contém mais de um aluno, apenas a primeira linha será considerada.',
      );
      print(
        '--------------------------------------------------------------------------------------',
      );
    } else if (students.isEmpty) {
      print('---------------------------------');
      print('O arquivo informado contém dados.');
      print('---------------------------------');

      return;
    }

    if (argId == null) {
      print('Qual o ID do estudante que deseja atualizar?');

      final receivedId = int.tryParse(stdin.readLineSync() ?? '');

      if (receivedId != null) {
        return await _updateStudent(filePath, receivedId);
      } else {
        print('-----------------------');
        print('Id de usuário inválido.');
        print('-----------------------');

        return;
      }
    }

    _updateStudent(students, int.parse(argId));
  }

  Future<void> _updateStudent(List<String> students, int argId) async {
    print('Lendo dados do arquivo...');
    try {
      final student = students.first;
      final data = student.split(';');

      final coursesFutureList = data[2].split(',').map((e) async {
        final c = await productRepository.findByName(e.trim());
        return c.copyWith(isStudent: true);
      }).toList();

      final courses = await Future.wait(coursesFutureList);

      final studentModel = Student(
        id: argId,
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

      studentRepository.update(studentModel);

      if (!(students.length > 1)) print('-----------------------------');
      print('Aluno atualizado com sucesso.');
      print('-----------------------------');
    } catch (e) {
      print('----------------------------------------------');
      print('O sistema não pôde ler o arquivo especificado.');
      print('----------------------------------------------');
    }
  }
}
