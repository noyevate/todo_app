import 'package:todo_app/feature/task/domain/entities/task.dart';
import 'package:todo_app/feature/task/domain/repositories/task_repository.dart';

class FakeRepository implements TaskRepository {
  final List<Task> _tasks = [];

  @override
  Future<void> addTask(Task task) async {
    _tasks.add(task);
  }

  @override
  Future<List<Task>> getTasks() async {
    return _tasks;
  }

  @override
  Future<void> deleteTask(String taskId) async {
    _tasks.removeWhere((t) => t.id == taskId);
  }

  @override
  Future<void> toggleTaskCompletion(Task task) async {
    final index = _tasks.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      _tasks[index] = task.copyWith(isCompleted: !task.isCompleted);
    }
  }

  @override
  Future<void> updateTask(Task task) async {
    final index = _tasks.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      _tasks[index] = task;
    }
  }
}
