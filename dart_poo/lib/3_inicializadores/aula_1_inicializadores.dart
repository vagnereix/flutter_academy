import 'package:dart_poo/3_inicializadores/classe_cliente.dart';
import 'package:dart_poo/3_inicializadores/classe_produto.dart';

void main() {
  var produto = Produto(id: 1, nome: 'Caneca', preco: 23.5);
  print(produto.nome);

  var cliente = Cliente(nome: '');
  cliente.nome = 'Vagner';
  print(cliente.nome);
}
