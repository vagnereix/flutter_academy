import 'dart:io';

import 'package:_students_cli/src/repositories/student_repository.dart';
import 'package:args/command_runner.dart';

class DeleteByIdCommand extends Command {
  final StudentRepository studentRepository;

  DeleteByIdCommand({
    required this.studentRepository,
  }) {
    argParser.addOption(
      'id',
      help: 'Id of the student to be deleted.',
      abbr: 'i',
    );
  }

  @override
  String get description => 'Delete a student by your id';

  @override
  String get name => 'deleteById';

  @override
  Future<void> run() async {
    if (argResults?['id'] == null) {
      print('Qual o ID do estudante que deseja deletar?');

      final receivedId = int.tryParse(stdin.readLineSync() ?? '');

      if (receivedId != null) {
        print('Buscando aluno...');
        await _deleteUser(receivedId);
        return;
      } else {
        print('-----------------------');
        print('Id de usuário inválido.');
        print('-----------------------');

        return;
      }
    }

    print('Buscando aluno...');
    final argId = int.tryParse(argResults?['id']);

    if (argId == null) {
      print('-----------------------');
      print('Id de usuário inválido.');
      print('-----------------------');

      return;
    }

    await _deleteUser(argId);
  }

  Future<void> _deleteUser(int id) async {
    try {
      final student = await studentRepository.findById(id);
      print('Tem certeza que deseja deletar o aluno ${student.name}? (S/N)');
    } on Exception catch (e) {
      return print(e.toString());
    }

    final response = stdin.readLineSync();

    if (response?.toLowerCase() == 's') {
      try {
        await studentRepository.deletebyId(id);

        print('---------------------------');
        print('Aluno deletado com sucesso.');
        print('---------------------------');
      } on Exception catch (e) {
        print(e.toString());
      }
    } else {
      return;
    }
  }
}
