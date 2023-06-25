void main() {
  var nome = 'Vagner';

  print(nome.saudacao());
}

extension SaudacaoStringExtension on String {
  String saudacao() {
    return 'Olá $this, bem vindo à Academia do Flutter.';
  }
}
