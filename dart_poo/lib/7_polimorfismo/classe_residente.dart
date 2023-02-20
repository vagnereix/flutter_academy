import 'package:dart_poo/7_polimorfismo/classe_cirugiao.dart';

class Residente extends Cirurgiao {
  @override
  void operar() {
    super.operar();

    // Sobrescrita de método
    print('Realizando ação, após ação do pai ser concluída.');
  }
}
