import 'package:dart_poo/5_covariant/classe_banana.dart';
import 'package:dart_poo/5_covariant/classe_fruta.dart';
import 'package:dart_poo/5_covariant/classe_humano.dart';
import 'package:dart_poo/5_covariant/classe_macaco.dart';

void main() {
  var humano = Humano();
  humano.comer(Fruta());

  var macaco = Macaco();
  macaco.comer(Banana(tipo: 'Nanica'));
}
