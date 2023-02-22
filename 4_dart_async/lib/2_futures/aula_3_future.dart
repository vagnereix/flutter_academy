void main() {
  print('Inicio.');

  Future(() => print('Função future.'))
      .then((value) => print('Caso do sucesso.'))
      .catchError((onError) => print('Caso do sucesso.'))
      .whenComplete(
        () => print('Caso de completado, idependente do estado.'),
      );

  print('Fim.');
}
