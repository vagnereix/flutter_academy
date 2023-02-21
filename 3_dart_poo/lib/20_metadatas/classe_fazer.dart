// ignore_for_file: public_member_api_docs, sort_constructors_first
class Fazer {
  final String quem;
  final String oque;

  const Fazer({
    required this.quem,
    required this.oque,
  });

  @override
  String toString() => 'Fazer(quem: $quem, oque: $oque)';
}
