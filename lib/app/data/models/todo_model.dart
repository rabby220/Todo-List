import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final DateTime createAt;

  TodoModel(
      {required this.title, required this.createAt});
}