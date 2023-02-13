void main() {
  final lista = ['Vagner'];
  print(lista.hashCode);

  funcao(lista);
  print(lista);

  final nome = 'Vagner';
  print(nome.hashCode);

  funcaoAlteraNome(nome);
  print(nome);
}

void funcao(List<String> lista) {
  print(lista.hashCode);
  lista.add('Reis');
}

void funcaoAlteraNome(String nome) {
  nome += ' Reis';
  print(nome.hashCode);
}

List<String> funcaoCorreta(List<String> lista) {
  final copia = [...lista];
  print(lista.hashCode);
  copia.add('Reis');

  return copia;
}
