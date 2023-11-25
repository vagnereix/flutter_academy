import 'package:freezed_annotation/freezed_annotation.dart';

part 'unions.freezed.dart';

@freezed
class Unions with _$Unions {
  const factory Unions.person({
    required String name,
    required int age,
  }) = _Person;

  const factory Unions.city({
    required String name,
    required int populations,
  }) = _City;
}

void main() {
  final person = Unions.person(name: 'John', age: 30);
  final city = Unions.city(name: 'London', populations: 8312);

  print(person.name);
  print(city.name);

  switch (person) {
    case _Person():
      print('Person instance');
      break;
    case _City():
      print('City instance');
      break;
  }
}
