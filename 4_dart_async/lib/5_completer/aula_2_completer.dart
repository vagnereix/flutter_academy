import 'dart:async';

Future<void> main() async {
  final usuarioRepository = UsuarioRepository();

  usuarioRepository.salvar((success) {
    print(success);
  }, (error) {
    print(error);
  });

  try {
    final usuarioSalvo = await usuarioRepository.salvarCompleter();

    print(usuarioSalvo);
  } on Exception catch (e) {
    print(e);
  }
}

class UsuarioRepository {
  void salvar(
    void Function(String) callbackSuccess,
    void Function(String) callbackError,
  ) {
    Timer(Duration(seconds: 2), () {
      try {
        callbackSuccess('Usuário salvo.');
      } on Exception {
        callbackError('Erro ao salvar usuário.');
      }
    });
  }

  Future<String> salvarCompleter() {
    final completer = Completer<String>();

    Timer(
      Duration(seconds: 2),
      () {
        try {
          completer.complete('Usuário salvo com sucesso.');
        } catch (error) {
          completer.completeError('Erro ao salvar usuário');
        }
      },
    );

    return completer.future;
  }
}
