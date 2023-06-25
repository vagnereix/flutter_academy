// Variáveis de nível superior não podem ser
// inicializadas depois.
String nomeCompletoSuperior = 'Vagner Reis';
String? nomeCompletoSuperiorNula;

void main() {
  String? nomeCompleto = 'Vagner Reis';
  nomeCompleto = null;

  // Forçando a existência da variável com o `!`
  // print(nomeCompleto!.length);

  // Variáveis locais são nulas (nullable) por padrão
  // Atribuindo um valor, são promovidas a null safety non-null.
  nomeCompleto = 'Dos Reix, Vagner';
  print(nomeCompleto.length);

  // Variáveis de nível superior NUNCA são promovidas
  // a null safety non-null
  nomeCompletoSuperiorNula = 'non-null';

  // ERROR:
  // if (nomeCompletoSuperiorNula != null) {
  //   print(nomeCompletoSuperiorNula.length);
  // }
}
