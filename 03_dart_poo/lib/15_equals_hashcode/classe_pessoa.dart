// ignore_for_file: public_member_api_docs, sort_constructors_first
class Pessoa {
  String nome;
  String email;

  Pessoa({
    required this.nome,
    required this.email,
  });

  @override
  bool operator ==(covariant Pessoa other) {
    if (identical(this, other)) return true;

    return other.nome == nome && other.email == email;
  }

  @override
  int get hashCode => nome.hashCode ^ email.hashCode;

  @override
  String toString() => 'Pessoa(nome: $nome, email: $email)';
}
