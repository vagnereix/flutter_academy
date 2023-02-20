import 'package:dart_poo/8_interfaces/classe_carro.dart';

class Gol implements Carro {
  @override
  String marca = 'Chevrolet';
  @override
  String modelo = 'Gol';
  @override
  int portas = 4;

  @override
  int velocidadeMax() {
    return 200;
  }
}
