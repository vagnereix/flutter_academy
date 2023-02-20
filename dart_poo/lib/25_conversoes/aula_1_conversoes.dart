import 'package:dart_poo/25_conversoes/modelos/aluno.dart';
import 'package:dart_poo/25_conversoes/modelos/curso.dart';
import 'package:dart_poo/25_conversoes/modelos/endereco.dart';

void main() {
  final alunoInJSON = <String, dynamic>{
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

  final cursosMap = alunoInJSON['cursos'] as List<Map<String, String>>;
  final cursos = cursosMap
      .map(
        (curso) => Curso(
          nome: curso['nome'] as String,
          descricao: curso['descricao'] as String,
        ),
      )
      .toList();

  final endereco = alunoInJSON['endereco'] as Map<String, String>;

  final aluno = Aluno(
    nome: alunoInJSON['nome'],
    endereco: Endereco(
      cidade: endereco['cidade'] as String,
      estado: endereco['estado'] as String,
      cep: endereco['cep'] as String,
    ),
    cursos: cursos,
  );

  print(aluno);
}
