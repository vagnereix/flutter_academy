import 'package:dart_poo/8_interfaces/classe_carro.dart';
import 'package:dart_poo/9_auto_promocao/classe_civic.dart';
import 'package:dart_poo/9_auto_promocao/classe_gol.dart';

void main() {
  var civic = Civic();
  var gol = Gol();

  print(civic.velocidadeMax());
  print(gol.velocidadeMax());

  Carro carro = civic;
  print(carro is Civic ? carro.tipoDeRodas() : 'Não disponível.');
}
