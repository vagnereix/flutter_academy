import 'dart:convert';

import 'address.dart';
import 'course.dart';

class Student {
  final int? id;
  final String name;
  final int? age;
  final List<String> nameCourses;
  final List<Course> courses;
  final Address address;

  Student({
    this.id,
    required this.name,
    this.age,
    required this.nameCourses,
    required this.courses,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'age': age,
      'nameCourses': nameCourses,
      'courses': courses.map((x) => x.toMap()).toList(),
      'address': address.toMap(),
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      age: map['age'] != null ? map['age'] as int : null,
      nameCourses: List<String>.from((map['nameCourses'])),
      courses: List<Course>.from(
        (map['courses']).map<Course>(
          (x) => Course.fromMap(x as Map<String, dynamic>),
        ),
      ),
      address: Address.fromMap(map['address']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Student.fromJson(String source) =>
      Student.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Student(id: $id, name: $name, age: $age, nameCourses: $nameCourses, courses: $courses, address: $address)';
  }

  Student copyWith({
    int? id,
    String? name,
    int? age,
    List<String>? nameCourses,
    List<Course>? courses,
    Address? address,
  }) {
    return Student(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      nameCourses: nameCourses ?? this.nameCourses,
      courses: courses ?? this.courses,
      address: address ?? this.address,
    );
  }
}
