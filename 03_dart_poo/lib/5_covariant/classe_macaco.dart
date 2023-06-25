import 'package:dart_poo/5_covariant/classe_banana.dart';
import 'package:dart_poo/5_covariant/classe_mamifero.dart';

class Macaco extends Mamifero {
  @override
  void comer(Banana fruta) {}
}
