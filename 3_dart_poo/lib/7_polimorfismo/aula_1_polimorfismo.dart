import 'package:dart_poo/7_polimorfismo/classe_cirugiao.dart';
import 'package:dart_poo/7_polimorfismo/classe_medico.dart';
import 'package:dart_poo/7_polimorfismo/classe_pediatra.dart';

void main() {
  var medicos = <Medico>[
    Cirurgiao(),
    Pediatra(),
  ];

  // Toda a equipe de médicos é chamada e cada um
  // faz o seu trabalho, de acordo com sua especialidade
  for (var medico in medicos) {
    medico.operar();
  }
}
