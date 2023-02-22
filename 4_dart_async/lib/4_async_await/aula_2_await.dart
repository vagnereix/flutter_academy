void main() {
  // 0. Inicia execução
  print('Inicio da funcão main.');

  // 1. Chama o Future totalAlunos
  final totalDeAlunosADF = totalAlunos();

  // 3. Future ainda em processamento, define o Callback de sucesso
  totalDeAlunosADF.then((value) {
    // 6. Executa o Callback de sucesso
    print('Total de alunos: $value');
  });

  // 4. Continua
  print('Fim da funcão main.');
}

Future<int> totalAlunos() async {
  // 2. Agenda no Event Loop o Future a ser executado
  final total = await Future.value(200);

  // 5. Executa o Future agendado e retorna com estado de sucesso
  return total;
}
