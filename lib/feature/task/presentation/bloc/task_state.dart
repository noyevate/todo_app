
// import 'package:equatable/equatable.dart';
// import 'package:todo/feature/task/domain/entities/task.dart';

import 'package:equatable/equatable.dart';
import 'package:todo_app/feature/task/domain/entities/task.dart';

enum TaskFilter { all, active, completed }

// class TaskState extends Equatable {
//   final List<Task> tasks;
//   final TaskFilter filter;

//   const TaskState({
//     required this.tasks,
//     this.filter = TaskFilter.all,
//   });

//   List<Task> get filteredTasks {
//     switch (filter) {
//       case TaskFilter.active:
//         return tasks.where((task) => !task.isCompleted).toList();
//       case TaskFilter.completed:
//         return tasks.where((task) => task.isCompleted).toList();
//       case TaskFilter.all:
//       default:
//         return tasks;
//     }
//   }

//   @override
//   List<Object?> get props => [tasks, filter];

//   TaskState copyWith({
//     List<Task>? tasks,
//     TaskFilter? filter,
//   }) {
//     return TaskState(
//       tasks: tasks ?? this.tasks,
//       filter: filter ?? this.filter,
//     );
//   }
// }

enum SortOrder { newestFirst, oldestFirst }

class TaskState extends Equatable {
  final List<Task> tasks;
  final TaskFilter filter;
  final SortOrder sortOrder; // ✅

  const TaskState({
    required this.tasks,
    this.filter = TaskFilter.all,
    this.sortOrder = SortOrder.newestFirst, // ✅ default
  });

  TaskState copyWith({
    List<Task>? tasks,
    TaskFilter? filter,
    SortOrder? sortOrder,
  }) {
    return TaskState(
      tasks: tasks ?? this.tasks,
      filter: filter ?? this.filter,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }

  List<Task> get filteredTasks {
    final filtered = switch (filter) {
      TaskFilter.active => tasks.where((t) => !t.isCompleted),
      TaskFilter.completed => tasks.where((t) => t.isCompleted),
      TaskFilter.all => tasks,
    };

    final sorted = filtered.toList()
      ..sort((a, b) => sortOrder == SortOrder.newestFirst
          ? b.createdAtDate.compareTo(a.createdAtDate)
          : a.createdAtDate.compareTo(b.createdAtDate));

    return sorted;
  }

  @override
  List<Object?> get props => [tasks, filter, sortOrder];
}
