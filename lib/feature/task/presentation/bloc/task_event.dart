
import 'package:todo_app/feature/task/domain/entities/task.dart';
import 'package:todo_app/feature/task/presentation/bloc/task_state.dart';

abstract class TaskEvent {}

class LoadTasks extends TaskEvent {}

class AddTask extends TaskEvent {
  final Task task;
  AddTask(this.task);
}

class DeleteTask extends TaskEvent {
  final String taskId;
  DeleteTask(this.taskId);
}

class ToggleTaskCompletion extends TaskEvent {
  final Task task;
  ToggleTaskCompletion(this.task);
}

class UpdateTask extends TaskEvent {
  final Task task;
  UpdateTask(this.task);
}

class FilterTasks extends TaskEvent {
  final TaskFilter filter;
  FilterTasks(this.filter);
}

class ToggleSortOrder extends TaskEvent {}


