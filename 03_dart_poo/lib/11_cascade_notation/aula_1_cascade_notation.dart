void main() {
  var pessoa = Pessoa()
    ..nome = 'Vagner'
    ..email = 'vagnereix.dev@gmail.com'
    ..printPessoa();
}

class Pessoa {
  String? nome;
  String? email;

  void printPessoa() {
    print('$nome - $email');
  }
}
