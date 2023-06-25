import 'package:dart_poo/8_interfaces/classe_carro.dart';

class Civic implements Carro {
  @override
  String marca = 'Honda';
  @override
  String modelo = 'Civic';
  @override
  int portas = 4;

  @override
  int velocidadeMax() {
    return 300;
  }

  String tipoDeRodas() {
    return 'Esportivas';
  }
}
