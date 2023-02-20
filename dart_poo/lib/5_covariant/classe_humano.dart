import 'package:dart_poo/5_covariant/classe_fruta.dart';
import 'package:dart_poo/5_covariant/classe_mamifero.dart';

class Humano extends Mamifero {
  @override
  void comer(Fruta fruta) {}
}
