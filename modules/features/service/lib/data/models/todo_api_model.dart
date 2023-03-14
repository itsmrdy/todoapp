// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:core/interfaces/entity_mapper.dart';
import 'package:domain/entities/todo/todo_collection.dart';

class TodoApiModel extends EntityMapper<TodoCollection> {
  final String? id;
  final String? taskName;
  final String? description;
  final String? date;

  TodoApiModel({
    required this.id,
    required this.taskName,
    required this.description,
    required this.date,
  });

  // factory TodoApiModel.fromJson(
  //   Map<String, dynamic> json,
  // ) =>
  //     _$TodoApiModelFromJson(json);

  // Map<String, dynamic> toJson() => _$TodoApiModelToJson(this);

  @override
  TodoCollection toEntity() {
    return TodoCollection(
      title: taskName,
      description: description,
      date: date,
      id: id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'taskName': taskName,
      'description': description,
      'date': date,
    };
  }

  factory TodoApiModel.fromMap(Map<String, dynamic> map) {
    return TodoApiModel(
      id: map['id'] != null ? map['id'] as String : null,
      taskName: map['taskName'] != null ? map['taskName'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      date: map['date'] != null ? map['date'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoApiModel.fromJson(String source) =>
      TodoApiModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
