void main() {
  Future<int>(
    () {
      return 10 ~/ 3;
    },
  ).then(
    (value) {
      print('Valor: $value');

      onError:
      (error) {
        print('Ocorreu um erro: $error');

        throw Exception('Aconteceu um erro ao tratar primeiro erro.');
      };
    },
  ).catchError(
    (onError) {
      print('Erro ao tratar primeiro erro: $onError');
    },
    test: (error) => error is UnsupportedError,
  ).catchError(
    (onError) {
      print('Erro ao tratar primeiro erro: $onError');
    },
  ).whenComplete(
    () {
      print('Valor informado.');
    },
  );
}
