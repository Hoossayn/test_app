import 'package:test_app/data/model/task_entity.dart';

sealed class TaskState {}

final class TaskInitial extends TaskState {}

final class TaskStateLoaded extends TaskState {
  final List<Task> task;

  TaskStateLoaded(this.task);
}