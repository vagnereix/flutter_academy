void main() async {
  print('Inicio da funcão main.');

  try {
    final id = await getId();
    final nome = await getNome(id);

    print(nome);
  } catch (error) {
    print(error);
  }

  print('Fim da funcão main.');
}

Future<int> getId() async => 1;
Future<String> getNome(int id) async =>
    throw Exception('Erro ao retornar nome.');
