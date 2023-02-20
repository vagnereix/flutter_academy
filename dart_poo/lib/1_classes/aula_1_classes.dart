import 'package:dart_poo/1_classes/classe_camiseta.dart';

void main() {
  var camisetaNike = Camiseta();

  camisetaNike.cor = 'Preta';
  camisetaNike.tamanho = 'G';
  camisetaNike.marca = 'Nike';

  print('''
  ${camisetaNike.cor}
  ${camisetaNike.tamanho}
  ${camisetaNike.marca}
  ''');

  print(camisetaNike.atributoDeClassePrivado);
  print(Camiseta.atributoDeClasse);
}
