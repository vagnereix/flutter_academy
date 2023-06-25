void main() {
  // Não aceita elementos nulos e nem pode ser nula.
  List<String> nomes = [];

  // Pode ser nula, mas não aceita elementos nulos.
  List<String>? nomesNulos;

  List<String> naoAceitaElementosNulos = ['Vagner'];

  List<String?> aceitaElementosNulos = ['Vagner', null, 'Reis'];
  List<String?>? aceitaElementosNulosPodeSerNula;

  print(
    '$nomes, $nomesNulos, $naoAceitaElementosNulos, $aceitaElementosNulos, $aceitaElementosNulosPodeSerNula',
  );
}
