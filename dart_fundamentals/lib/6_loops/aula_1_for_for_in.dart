// ignore_for_file: public_member_api_docs, sort_constructors_first
void main() {
  final numeros = List.generate(5, (index) => index);
  final nomes = ['Vagner', 'Queiroz', 'Reis'];

  for (int i = 0; i < numeros.length; i++) {
    print(numeros[i]);
  }

  for (int i = 0; i < nomes.length; i++) {
    print(nomes[i]);
  }

  // Parando a execução com o break.
  for (int i = 0; i < nomes.length; i++) {
    if (nomes[i] == 'Queiroz') break;
    print(nomes[i]);
  }

  // Pulando a execução com o continue.
  for (int i = 0; i < nomes.length; i++) {
    if (nomes[i] == 'Queiroz') continue;
    print(nomes[i]);
  }

  for (final numero in numeros) {
    print(numero);
  }

  for (final nome in nomes) {
    print(nome);
  }

  nomes.forEach(print);
}
