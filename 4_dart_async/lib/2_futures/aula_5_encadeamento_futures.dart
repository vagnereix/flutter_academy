void main() {
  funcao_1().then(
    (value) => funcao_2(value).then(
      (value) => print(value),
    ),
  );

  funcao_1().then((value) => funcao_2(value)).then((value) => print(value));
}

Future<String> funcao_1() {
  return Future.delayed(Duration(seconds: 2), () => 'Parâmetro');
}

Future<String> funcao_2(String param) {
  return Future.delayed(
    Duration(seconds: 2),
    () => 'Parâmentro recebido: $param.',
  );
}
