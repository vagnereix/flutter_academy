void main() {
  final diaDaSemanaInt = 0;
  var diaDaSemanaString = '';

  if (diaDaSemanaInt == 0) {
    diaDaSemanaString = 'Segunda-feira';
  } else if (diaDaSemanaInt == 1) {
    diaDaSemanaString = 'Terça-feira';
  } else {
    diaDaSemanaString = 'Não identificado.';
  }

  switch (diaDaSemanaInt) {
    case 0:
      diaDaSemanaString = 'Segunda-feira';
      break;
    case 1:
      diaDaSemanaString = 'Terça-feira';
      break;
    default:
      diaDaSemanaString = 'Não identificado.';
      break;
  }

  print(diaDaSemanaString);
}
