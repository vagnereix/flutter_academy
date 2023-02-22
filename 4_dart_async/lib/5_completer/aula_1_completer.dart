import 'dart:async';

Future<void> main() async {
  try {
    print(await buscar(0));
  } catch (e, s) {
    print('$e, $s');
  }
}

Future<String> buscar(int numero) {
  final completer = Completer<String>();

  Timer(
    Duration(seconds: 2),
    () {
      numero == 0
          ? completer.complete('Envio realizado com sucesso.')
          : completer.completeError(
              'Erro no envio.',
              StackTrace.current,
            );
    },
  );

  return completer.future;
}
