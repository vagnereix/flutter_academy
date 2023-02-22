void main() {
  print('Inicio da funcão main.');

  final future_1 =
      Future<String>.delayed(Duration(seconds: 1), () => 'Future 1');
  final future_2 =
      Future<String>.delayed(Duration(seconds: 3), () => 'Future 2');
  final future_3 =
      Future<String>.delayed(Duration(seconds: 1), () => 'Future 3');
  final future_4 =
      Future<String>.delayed(Duration(seconds: 1), () => 'Future 4');
  final future_5 = Future<String>.delayed(
      Duration(seconds: 1), () => Future.error('Erro na Future 5'));

  print(DateTime.now().toIso8601String());
  Future.wait(
    [
      future_1,
      future_2,
      future_3,
      future_4,
      future_5,
    ],
    eagerError: true,
  ).then((values) {
    print(values);
    print(DateTime.now().toIso8601String());
  }).catchError((error) {
    print(DateTime.now().toIso8601String());
    print(error);
  });

  print('Fim da funcão main.');
}
