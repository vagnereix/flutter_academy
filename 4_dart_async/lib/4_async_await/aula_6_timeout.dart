import 'dart:async';

void main() async {
  await insertFunction()
      .timeout(Duration(seconds: 1), onTimeout: () => print('Erro de timeout.'))
      .catchError((error) {
    print('Erro no insert $error');
  });

  try {
    await insertFunction().timeout(Duration(seconds: 1));
  } on TimeoutException catch (error) {
    print('Erro no insert via try catch $error');
  }
}

Future<void> insertFunction() {
  return Future.delayed(Duration(seconds: 2), () => print('Insert concluído.'));
}
