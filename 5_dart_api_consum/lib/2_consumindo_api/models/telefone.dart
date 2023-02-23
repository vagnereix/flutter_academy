// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Telefone {
  final int ddd;
  final String numero;

  Telefone({
    required this.ddd,
    required this.numero,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ddd': ddd,
      'numero': numero,
    };
  }

  factory Telefone.fromMap(Map<String, dynamic> map) {
    return Telefone(
      ddd: map['ddd'] as int,
      numero: map['numero'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Telefone.fromJson(String source) =>
      Telefone.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Telefone(ddd: $ddd, numero: $numero)';
}
