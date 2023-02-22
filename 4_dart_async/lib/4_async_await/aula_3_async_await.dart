void main() async {
  print('Inicio da funcão main.');

  final id = await getId();
  final nome = await getNome(id);

  print(nome);

  print('Fim da funcão main.');
}

Future<int> getId() async => 1;
Future<String> getNome(int id) async => 'Vagner';
