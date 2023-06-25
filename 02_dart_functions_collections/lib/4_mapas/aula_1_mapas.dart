void main() {
  final pacientesMap = <String, String>{
    'nome': 'Vagner',
    'profissao': 'Desenvolvedor',
  };

  // Mapa pode ser nulo, mas não pode ter chaves ou valores nulos.
  Map<String, String>? pacientesNullSafetyMap;

  // Mapa não pode ser nulo, mas pode ter chaves chaves nulos.
  Map<String?, String> pacientesNullSafetyMapSemChave = {
    null: 'Vagner',
  };

  // Mapa não pode ser nulo, mas pode ter valores nulos.
  Map<String, String?> pacientesNullSafetyMapSemValor = {
    'nome': null,
  };

  pacientesMap.putIfAbsent('estado', () => 'MG');
  pacientesMap.putIfAbsent('estado', () => 'SP');
  print(pacientesMap);

  pacientesMap.update('estado', (value) => 'CE');
  print(pacientesMap);

  pacientesMap.update('cidade', (value) => 'Iguatu', ifAbsent: () => 'Iguatu');
  print(pacientesMap);

  print(
    'Estado onde o ${pacientesMap['nome']} mora atualmente: ${pacientesMap['estado']}.',
  );

  // Não utilizar se precisar de algum processo assíncrono.
  pacientesMap.forEach((key, value) {
    print('$key: $value');
  });

  // Utilizar se precisar de algum processo assíncrono.
  for (var paciente in pacientesMap.entries) {
    print('${paciente.key}: ${paciente.value}');
  }

  // Percorrendo todas as chaves de um Mapa.
  for (var chave in pacientesMap.keys) {
    print(chave);
  }

  // Percorrendo todos os valores de um Mapa.
  for (var valor in pacientesMap.values) {
    print(valor);
  }

  print(pacientesMap.map((key, value) => MapEntry(key, value.toUpperCase())));

  final mapaJSON = <String, dynamic>{
    'nome': 'Vagner',
    'endereco': {
      'cidade': 'Iguatu',
      'estado': 'CE',
      'cep': '63505-518',
    },
    'cursos': [
      {
        'nome': 'Academia do Flutter - Rodrigo Rahman',
        'descricao': 'Curso do básico ao avançado de Dart e Flutter.',
      },
      {
        'nome': 'Ignite - Rocketseat',
        'descricao': 'Bootcamp avançado de Node.js, ReactJS e React Native.',
      },
    ]
  };

  print(mapaJSON['cursos']);
}
