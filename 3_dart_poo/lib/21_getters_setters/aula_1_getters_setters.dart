// ignore_for_file: public_member_api_docs, sort_constructors_first
void main() {
  var pessoa = Pessoa();
  pessoa.nome = '';

  print(pessoa);
}

class Pessoa {
  String? _nome;

  String? get nome => _nome;
  set nome(String? nome) {
    if (nome != null && nome.isNotEmpty) {
      _nome = nome;
    }
  }

  @override
  String toString() => 'Pessoa(_nome: $_nome)';
}
