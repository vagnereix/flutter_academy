import 'package:dart_poo/16_ordenacao_default/classe_cliente.dart';

void main() {
  var cliente_1 = Cliente(nome: 'Vagner', telefone: '889');
  var cliente_2 = Cliente(nome: 'Queiroz', telefone: '889');
  var cliente_3 = Cliente(nome: 'Reis', telefone: '889');

  var lista = [cliente_1, cliente_2, cliente_3];
  print(lista);

  lista.sort();
  print(lista);
}
