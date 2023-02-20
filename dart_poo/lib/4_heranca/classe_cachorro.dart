import 'package:dart_poo/4_heranca/classe_animal.dart';

class Cachorro extends Animal {
  Cachorro({required super.idade, super.tamanho});
  // Cachorro({required int idade}) : super(idade: idade);

  @override
  int calcularIdadeHumana() {
    return idade * 7;
  }
}

// Com a palavra reservada `extends` definimos que uma classe extende-se à outra,
// em outras palavras definimos que uma classe também é ou faz parte de outra classe

// Podemos passar informações para construtores superiores com a palavra
// reservada `super` antes do corpo do construtor da classe filha

// A palavra reservada `covariant` nos permite aceitar a sobrescrita com classes
// filhas das que estamos trabalhando ou esperando receber em um método
