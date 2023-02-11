void main() {
  final sexo = 'M';
  final idade = 18;

  if (sexo == 'M' && idade >= 18) {
    print('Pode se alistar!');
  } else {
    print('Não pode se alistar!');
  }

  if (sexo != 'M' || idade < 18) {
    print('Não pode se alistar!');
  } else {
    print('Pode se alistar!');
  }

  if (!(idade >= 18)) {
    print('Não pode se alistar!');
  }
}
