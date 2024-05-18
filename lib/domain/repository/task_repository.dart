import 'package:collection/collection.dart';
import '../../data/model/task_entity.dart';


class TaskRepository {
  List<Task> taskList = [];

  void addTask(List<Task> tasks) {
    taskList = tasks;
  }


  List<Task> updateTask(int? id, String? name, bool? isCompleted) {
    Task? taskModel =
    taskList.firstWhereOrNull((element) => element.id == id);
    if (taskModel != null) {
      taskList = taskList.map((task) {
        if (task.id == id) {
          return task.copyWith(
            name: name,
            isCompleted: isCompleted
          );
        }
        return task;
      }).toList();
    }
    return taskList;
  }


}