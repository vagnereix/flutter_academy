import 'package:dart_poo/4_heranca/classe_cachorro.dart';

void main() {
  var cachorro = Cachorro(idade: 1, tamanho: 'Médio');

  print(cachorro.calcularIdadeHumana());
  print(cachorro.recuperarIdade());
  print(cachorro.tamanho);
}
