import 'package:dart_poo/15_equals_hashcode/classe_pessoa.dart';

void main() {
  var pessoa_1 = Pessoa(nome: 'Vagner', email: 'vagnereix.dev@gmail.com');
  var pessoa_2 = Pessoa(nome: 'Vagner', email: 'vagnereix.dev@gmail.com');

  print(pessoa_1.hashCode);
  print(pessoa_2.hashCode);

  if (pessoa_1 == pessoa_2) {
    print('São iguais.');
  } else {
    print('Não são iguais.');
  }
  print(pessoa_1);
}
