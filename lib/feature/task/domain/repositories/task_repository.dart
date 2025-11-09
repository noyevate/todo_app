import '../../domain/entities/task.dart';

abstract class TaskRepository {
  Future<void> addTask(Task task);
  Future<List<Task>> getTasks();
  Future<void> deleteTask(String taskId);
  Future<void> toggleTaskCompletion(Task task);
  Future<void> updateTask(Task task);

}