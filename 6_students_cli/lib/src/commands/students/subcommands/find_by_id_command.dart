import 'dart:io';

import 'package:_students_cli/src/repositories/student_repository.dart';
import 'package:args/command_runner.dart';

class FindByIdCommand extends Command {
  final StudentRepository studentRepository;

  FindByIdCommand({
    required this.studentRepository,
  }) {
    argParser.addOption('id', help: 'Student id.', abbr: 'i');
  }

  @override
  String get description => "Find a single student by your id";

  @override
  String get name => 'findById';

  @override
  void run() async {
    if (argResults?['id'] == null) {
      print('Qual o ID do estudante que deseja buscar?');

      final receivedId = int.tryParse(stdin.readLineSync() ?? '');

      if (receivedId != null) {
        await _findUser(receivedId);
        return;
      } else {
        _printInvalidMessage('Id de usuário inválido');
        return;
      }
    }

    final argId = int.tryParse(argResults?['id']);

    if (argId == null) {
      _printInvalidMessage('Id de usuário inválido.');
      return;
    }

    await _findUser(argId);
  }

  Future<void> _findUser(int id) async {
    print('Buscando dados do aluno...');

    try {
      final student = await studentRepository.findById(id);

      print('--------------------------------------------------------------');
      print('ALUNO ENCONTRADO:');
      print('--------------------------------------------------------------');
      print('Nome: ${student.name}');
      print('Idade: ${student.age ?? 'Não informada'}');
      print('Endereço:');
      print(
        '   ${student.address.street} - ${student.address.number} - ${student.address.city.name} - ${student.address.zipCode}',
      );
      print(
        'Telefone: (${student.address.phone.ddd}) ${student.address.phone.phone}',
      );
      print('Cursos: ${student.nameCourses}');
      print('--------------------------------------------------------------');
    } catch (e) {
      _printInvalidMessage(e.toString());
    }
  }

  void _printInvalidMessage(String message) {
    print('-------------------------------------');
    print(message);
    print('-------------------------------------');
  }
}
