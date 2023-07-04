import 'package:hive_flutter/adapters.dart';
part 'TodoModel.g.dart';

@HiveType(typeId: 1)
class TodoModel {
  @HiveField(1)
  String? id;
  @HiveField(0)
  final String? todo;
  @HiveField(2)
  final bool? isChecked;

  TodoModel({this.todo, this.id, this.isChecked = false});
}
