import 'package:dart_poo/20_metadatas/classe_fazer.dart';

@Fazer(
  quem: 'Vagner',
  oque: 'Lendo anotação de classe',
)
class Pessoa {
  @Fazer(
    quem: 'Vagner',
    oque: 'Lendo anotação de atributo',
  )
  String? nome;

  @Fazer(
    quem: 'Vagner',
    oque: 'Lendo anotação de método',
  )
  void printar() {
    print('Printando pessoa');
  }
}
