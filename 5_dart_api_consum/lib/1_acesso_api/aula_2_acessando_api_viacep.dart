import 'dart:convert';

import 'package:http/http.dart';

Future<void> main() async {
  final response = await get(
    Uri.parse('https://viacep.com.br/ws/63505508/json/'),
  );

  if (response.statusCode != 200) return print('Formato de CEP inválido.');

  print(response.body);
  print(response.statusCode);

  final Map<String, dynamic> data = json.decode(response.body);

  if (data.containsKey('erro')) return print('Erro ao buscar CEP.');

  final enderecoMap = <String, String>{
    'cep': data['cep'],
    'logradouro': data['logradouro'],
    'bairro': data['bairro'],
    'localidade': data['localidade'],
    'uf': data['uf'],
  };

  print(enderecoMap);
}
