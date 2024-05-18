
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:test_app/bloc/task_event.dart';
import 'package:test_app/bloc/task_state.dart';
import 'package:test_app/domain/repository/task_repository.dart';

import '../data/model/task_entity.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  final TaskRepository todoRepo = TaskRepository();
  TaskBloc() : super(TaskInitial()) {
    on<TaskFetch>((event, emit) async {
      emit(TaskStateLoaded(todoRepo.taskList));
    });
    on<TaskAdd>((event, emit) async {
      final currentState = state;
      if (currentState is TaskStateLoaded) {
        final updatedList = List<Task>.from(currentState.task)..add(event.task);
        todoRepo.addTask(updatedList);
        emit(TaskStateLoaded(updatedList));
      } if (currentState is TaskInitial){
        final updatedList = [event.task];
        todoRepo.addTask(updatedList);
        emit(TaskStateLoaded(updatedList));
      }


    });

    on<TaskUpdate>((event, emit) async {
      emit(TaskStateLoaded(todoRepo.updateTask(
          event.id, event.name, event.isCompleted)));
    });
  }

  @override
  TaskState? fromJson(Map<String, dynamic> json) {
    if (json['data'] != null && (json['data'] as List<dynamic>).isNotEmpty) {
      final tasks = (json['data'] as List<dynamic>)
          .map((e) => Task.fromJson(e))
          .toList();
      todoRepo.addTask(tasks);
      return TaskStateLoaded(tasks);
    }
    return TaskInitial();
  }

  @override
  Map<String, dynamic>? toJson(TaskState state) {
    if (state is TaskStateLoaded) {
      return {'data': state.task.map((e) => e.toJson()).toList()};
    }
    return {'data': []};
  }
}