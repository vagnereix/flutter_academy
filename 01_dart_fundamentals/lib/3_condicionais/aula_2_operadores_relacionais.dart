void main() {
  // == (igualdade)
  // != (diferença)
  // > (maior que)
  // < (menor que)
  // <=(menor ou igual)
  // >=(maior ou igual)

  final idadeDoPetEmMeses = 3;
  final tipoDoPet = 'Cachorro';

  if (idadeDoPetEmMeses > 2) {
    print('Pode tomar vacina.');
  }

  if (idadeDoPetEmMeses == 3) {
    print('Pode tomar vacina.');
  }

  if (idadeDoPetEmMeses >= 3) {
    print('Pode tomar vacina.');
  }

  if (idadeDoPetEmMeses < 3) {
    print('Não pode tomar vacina.');
  }

  if (tipoDoPet != 'Cachorro') {
    print('Não temos vacina para o seu pet.');
  }
}
