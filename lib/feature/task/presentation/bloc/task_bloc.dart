import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/feature/task/domain/repositories/task_repository.dart';
import 'task_event.dart';
import 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository repository;

  TaskBloc(this.repository) : super(const TaskState(tasks: [])) {
    on<LoadTasks>((event, emit) async {
      final tasks = await repository.getTasks();
      emit(state.copyWith(tasks: tasks));
    });

    on<AddTask>((event, emit) async {
      await repository.addTask(event.task);
      final tasks = await repository.getTasks();
      emit(state.copyWith(tasks: tasks));
    });

    on<DeleteTask>((event, emit) async {
      await repository.deleteTask(event.taskId);
      final tasks = await repository.getTasks();
      emit(state.copyWith(tasks: tasks));
    });

    on<ToggleTaskCompletion>((event, emit) async {
      await repository.toggleTaskCompletion(event.task);
      final tasks = await repository.getTasks();
      emit(state.copyWith(tasks: tasks));
    });

    on<UpdateTask>((event, emit) async {
      await repository.updateTask(event.task);
      final tasks = await repository.getTasks();
      emit(state.copyWith(tasks: tasks));
    });

    on<FilterTasks>((event, emit) {
      emit(state.copyWith(filter: event.filter));
    });

    on<ToggleSortOrder>((event, emit) {
      final newOrder = state.sortOrder == SortOrder.newestFirst
          ? SortOrder.oldestFirst
          : SortOrder.newestFirst;

      emit(state.copyWith(sortOrder: newOrder));
    });
  }
}
