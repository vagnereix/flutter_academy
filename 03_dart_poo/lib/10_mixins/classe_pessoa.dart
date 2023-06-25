import 'package:dart_poo/10_mixins/classe_artista.dart';
import 'package:dart_poo/10_mixins/classe_cantor.dart';
import 'package:dart_poo/10_mixins/classe_dancarino.dart';

class Pessoa extends Artista with Dancarino, Cantor {}
