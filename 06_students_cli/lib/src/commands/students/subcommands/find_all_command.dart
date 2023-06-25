import 'dart:io';

import 'package:_students_cli/src/repositories/student_repository.dart';
import 'package:args/command_runner.dart';

class FindAllCommand extends Command {
  final StudentRepository studentRepository;

  FindAllCommand({
    required this.studentRepository,
  });

  @override
  String get description => 'Find all students';

  @override
  String get name => 'findAll';

  @override
  Future<void> run() async {
    print('Buscando todos os alunos...');

    final students = await studentRepository.findAll();
    print('Deseja ver os cursos de cada aluno? (S/N)');

    final response = stdin.readLineSync();

    if (response?.toLowerCase() == 's') {
      print('------------------------------');
      print('ESTUDANTES:');
      print('------------------------------');

      for (var student in students) {
        print('${student.name}\n');

        print('CURSOS MATRICULADOS:');

        student.courses
            .where((course) => course.isStudent == true)
            .map((course) => course.name)
            .toList()
            .forEach(print);

        print('------------------------------');
      }
    } else if (response?.toLowerCase() == 'n') {
      print('------------------------------');
      print('ESTUDANTES:');
      print('------------------------------');

      for (var student in students) {
        print(student.name);
      }

      print('------------------------------');
    } else {
      print('------------------------------');
      print('Comando inválido');
      print('------------------------------');
    }
  }
}
