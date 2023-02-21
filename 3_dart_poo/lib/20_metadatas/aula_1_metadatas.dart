import 'dart:mirrors';

import 'package:dart_poo/20_metadatas/classe_fazer.dart';
import 'package:dart_poo/20_metadatas/classe_pessoa.dart';

void main() {
  var pessoa_1 = Pessoa();

  var instanceMirror = reflect(pessoa_1);

  // Metadatas da minha classe
  ClassMirror classMirror = instanceMirror.type;

  for (var annotation in classMirror.metadata) {
    // Retorna a instância da anotação/metadata
    var instanceAnnotation = annotation.reflectee;

    if (instanceAnnotation is Fazer) {
      print(instanceAnnotation);
    }
  }

  for (var declarationMirror in classMirror.declarations.values) {
    if (declarationMirror is VariableMirror) {
      for (var annotation in declarationMirror.metadata) {
        var instanceAnnotation = annotation.reflectee;

        if (instanceAnnotation is Fazer) {
          print(instanceAnnotation);
        }
      }
    } else if (declarationMirror is MethodMirror) {
      for (var annotation in declarationMirror.metadata) {
        var instanceAnnotation = annotation.reflectee;

        if (instanceAnnotation is Fazer) {
          print(instanceAnnotation);
        }
      }
    }
  }
}
