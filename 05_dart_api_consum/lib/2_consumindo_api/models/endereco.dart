// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'cidade.dart';
import 'telefone.dart';

class Endereco {
  final String rua;
  final int numero;
  final Cidade cidade;
  final Telefone telefone;

  Endereco({
    required this.rua,
    required this.numero,
    required this.cidade,
    required this.telefone,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rua': rua,
      'numero': numero,
      'cidade': cidade.toMap(),
      'telefone': telefone.toMap(),
    };
  }

  factory Endereco.fromMap(Map<String, dynamic> map) {
    return Endereco(
      rua: map['rua'] as String,
      numero: map['numero'] as int,
      cidade: Cidade.fromMap(map['cidade'] as Map<String, dynamic>),
      telefone: Telefone.fromMap(map['telefone'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Endereco.fromJson(String source) =>
      Endereco.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Endereco(rua: $rua, numero: $numero, cidade: $cidade, telefone: $telefone)';
  }
}
