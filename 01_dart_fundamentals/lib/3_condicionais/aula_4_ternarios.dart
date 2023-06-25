void main() {
  final int idade = 12;

  // sem o operador ternário
  if (idade >= 18) {
    print('Maior de idade.');
  } else {
    print('Menor de idade.');
  }

  // com o operador ternário
  idade >= 18 ? print('Maior de idade.') : print('Menor de idade.');
}
