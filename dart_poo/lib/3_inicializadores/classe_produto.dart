// ignore_for_file: public_member_api_docs, sort_constructors_first
class Produto {
  final int? _id;
  final String? nome;
  final double? preco;

  Produto({
    required int id,
    required this.nome,
    required this.preco,
  }) : _id = id;
}
