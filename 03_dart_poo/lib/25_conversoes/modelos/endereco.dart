// ignore_for_file: public_member_api_docs, sort_constructors_first
class Endereco {
  final String cidade;
  final String estado;
  final String cep;

  Endereco({
    required this.cidade,
    required this.estado,
    required this.cep,
  });

  @override
  String toString() => 'Endereco(cidade: $cidade, estado: $estado, cep: $cep)';
}
