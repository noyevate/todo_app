import 'package:todo_app/feature/task/domain/repositories/task_repository.dart';

import '../entities/task.dart';

class UpdateTaskUseCase {
  final TaskRepository repository;
  UpdateTaskUseCase(this.repository);

  Future<void> call(Task task) => repository.updateTask(task);
}
