// import 'package:hive/hive.dart';
// import 'package:todo_app/feature/task/domain/repositories/task_repository.dart';
// import '../../domain/entities/task.dart';
// import '../models/task_model.dart';

// class HiveTaskRepositoryImpl implements TaskRepository {
//   final Box<TaskModel> taskBox = Hive.box<TaskModel>('tasks');

//   @override
//   Future<void> addTask(Task task) async {
//     await taskBox.put(task.id, TaskModel.fromEntity(task));
//   }

//   @override
//   Future<List<Task>> getTasks() async {
//     return taskBox.values.map((model) => model.toEntity()).toList();
//   }

//   @override
//   Future<void> deleteTask(String taskId) async {
//     await taskBox.delete(taskId);
//   }

//   @override
//   Future<void> toggleTaskCompletion(Task task) async {
//     final updatedTask = task.copyWith(isCompleted: !task.isCompleted);
//     await taskBox.put(updatedTask.id, TaskModel.fromEntity(updatedTask));
//   }

//   @override
//   Future<void> updateTask(Task task) async {
//     await taskBox.put(task.id, TaskModel.fromEntity(task));
//   }
// }

import 'package:hive/hive.dart';
import 'package:todo_app/feature/task/data/models/task_model.dart';
import 'package:todo_app/feature/task/domain/entities/task.dart';
import 'package:todo_app/feature/task/domain/repositories/task_repository.dart';

class HiveTaskRepository implements TaskRepository {
  final Box<TaskModel> taskBox;

  HiveTaskRepository({Box<TaskModel>? box})
      : taskBox = box ?? Hive.box<TaskModel>('tasks');

  @override
  Future<void> addTask(Task task) async {
    await taskBox.put(task.id, TaskModel.fromEntity(task));
  }

  @override
  Future<void> deleteTask(String taskId) async {
    await taskBox.delete(taskId);
  }

  @override
  Future<List<Task>> getTasks() async {
    return taskBox.values.map((model) => model.toEntity()).toList();
  }

  @override
  Future<void> toggleTaskCompletion(Task task) async {
    final updated = task.copyWith(isCompleted: !task.isCompleted);
    await taskBox.put(updated.id, TaskModel.fromEntity(updated));
  }

  @override
  Future<void> updateTask(Task task) async {
    await taskBox.put(task.id, TaskModel.fromEntity(task));
  }
}

