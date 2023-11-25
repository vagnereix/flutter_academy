// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TaskModel {
  final int id;
  final String description;
  final DateTime date;
  final bool finished;

  TaskModel({
    required this.id,
    required this.description,
    required this.date,
    required this.finished,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'description': description,
      'date': date.millisecondsSinceEpoch,
      'finished': finished,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'] as int,
      description: map['description'] as String,
      date: DateTime.parse(map['date'] as String),
      finished: map['status'] as int == 1,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TaskModel(id: $id, description: $description, date: $date, finished: $finished)';
  }

  TaskModel copyWith({
    int? id,
    String? description,
    DateTime? date,
    bool? finished,
  }) {
    return TaskModel(
      id: id ?? this.id,
      description: description ?? this.description,
      date: date ?? this.date,
      finished: finished ?? this.finished,
    );
  }
}
