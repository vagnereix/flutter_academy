import 'package:freezed_annotation/freezed_annotation.dart';

part 'person.freezed.dart';

@freezed
class Person with _$Person {
  factory Person({
    required String name,
    required int age,
  }) = _Person;
}

void main() {
  final person = Person(name: 'John', age: 30);
  print(person.name);
  print(person.age);

  person.toString();
  print(person.copyWith(name: 'John Leitão'));
}
