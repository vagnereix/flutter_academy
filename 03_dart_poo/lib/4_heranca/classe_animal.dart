abstract class Animal {
  final String? tamanho;
  final int idade;

  Animal({
    this.tamanho,
    required this.idade,
  });

  int recuperarIdade() {
    return idade;
  }

  int calcularIdadeHumana();
}

// Com a palavra reservada `abstract` definimos uma assinatura a ser seguida por
// classes que extenderem à essa, transformando uma classe em abstrata
