import 'package:_dart_api_consum/2_consumindo_api/repositories/aluno_repository.dart';

Future<void> main() async {
  final alunoRepository = AlunoRepository();

  final alunos = await alunoRepository.findAll();

  print(alunos);
}
