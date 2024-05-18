import 'package:test_app/data/model/task_entity.dart';

sealed class TaskEvent {}

final class TaskFetch extends TaskEvent {}

final class TaskAdd extends TaskEvent {
  final Task task;
  TaskAdd(this.task);
}


final class TaskUpdate extends TaskEvent {
  final int? id;
  final String? name;
  final bool? isCompleted;
  TaskUpdate({this.id, this.name, this.isCompleted});
}