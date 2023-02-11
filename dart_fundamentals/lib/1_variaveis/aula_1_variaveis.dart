void main() {
  // tipo nome = valor;

  // `num` pode ser double ou int, para variáveis
  // que podem ter ambos os tipos.
  num qualquerTipoNumero = 0;
  num qualquerTipoNumero2 = 0.1;

  int idade = 24;
  double valorIphone = 12.000;

  bool valor = true;
  valor = false;

  String nomeCurso = 'Academia do Flutter';

  // `var` idetifica automaticamente o tipo da variável
  // de acordo com o valor inicial da mesma (se houver).
  var indetificarTipo = 'Teste';

  // Pode ser qualquer coisa, pois todos os tipos
  // são filhos de Object.
  Object objetoQualquer = 1.2;

  // Também pode ser qualquer coisa, mas tentar
  // ao máximo não utilizar.
  dynamic dynamicQualquer = 'Vagner';
  dynamicQualquer = 123;

  print(
    '$qualquerTipoNumero, $qualquerTipoNumero2, $idade, $valorIphone, $valor, $nomeCurso, $indetificarTipo, $objetoQualquer, $dynamicQualquer',
  );
}
