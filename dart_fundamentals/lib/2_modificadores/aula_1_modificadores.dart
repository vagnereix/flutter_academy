void main() {
  var nomeCompleto = 'Vagner Reis';
  print(nomeCompleto);

  nomeCompleto = 'Dos Reis';
  print(nomeCompleto);

  // `final` torna a variável imutável, isso nos
  // ajuda a não ter um comportamento inesperado e
  // as mesmas são definidas em tempo de EXECUÇÃO (Runtime).
  final nomeCompletoFinal = 'Vagner Reix';

  // ERROR
  // nomeCompletoFinal = 'Dos Reix';

  // `const` torna a variável imutável, isso nos
  // ajuda a não ter um comportamento inesperado e
  // as mesmas são definidas em tempo de COMPILAÇÃO.
  // Só podem receber valores de outras contantes.
  const nomeCompletoConst = 'Reix';

  print(
    '$nomeCompletoFinal, $nomeCompletoConst',
  );
}
