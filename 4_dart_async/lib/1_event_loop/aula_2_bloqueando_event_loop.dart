import 'dart:io';

void main() {
  print('Início do main.');

  print(nome());
  print(sobreNome());

  print('Final do main.');
}

String nome() {
  sleep(Duration(seconds: 3));
  return 'Vagner';
}

String sobreNome() {
  sleep(Duration(seconds: 4));
  return 'Reis';
}
