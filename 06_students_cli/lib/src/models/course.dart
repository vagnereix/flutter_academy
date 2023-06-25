import 'dart:convert';

class Course {
  final int id;
  final String name;
  final bool? isStudent;

  Course({
    required this.id,
    required this.name,
    this.isStudent,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'isStudent': isStudent,
    };
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      id: map['id'] as int,
      name: map['name'] as String,
      isStudent: map['isStudent'] != null ? map['isStudent'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Course.fromJson(String source) =>
      Course.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Course(id: $id, name: $name, isStudent: $isStudent)';

  Course copyWith({
    int? id,
    String? name,
    bool? isStudent,
  }) {
    return Course(
      id: id ?? this.id,
      name: name ?? this.name,
      isStudent: isStudent ?? this.isStudent,
    );
  }
}
