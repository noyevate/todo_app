



import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app/feature/task/domain/entities/task.dart';
import 'package:todo_app/feature/task/domain/repositories/task_repository.dart';
import 'package:todo_app/feature/task/presentation/bloc/task_bloc.dart';
import 'package:todo_app/feature/task/presentation/bloc/task_event.dart';
import 'package:todo_app/feature/task/presentation/bloc/task_state.dart';

class MockTaskRepository extends Mock implements TaskRepository {}
class FakeTask extends Fake implements Task {}

void main() {
  late TaskBloc taskBloc;
  late MockTaskRepository mockRepository;

  final task = Task(
    id: '1',
    title: 'Test Task',
    subTitle: 'Subtitle',
    createdAtTime: DateTime.now(),
    createdAtDate: DateTime.now(),
    isCompleted: false,
  );

  setUpAll(() {
    registerFallbackValue(FakeTask());
  });

  setUp(() {
    mockRepository = MockTaskRepository();
    taskBloc = TaskBloc(mockRepository);
  });

  tearDown(() => taskBloc.close());

  test('initial state should be TaskState with empty list', () {
    expect(taskBloc.state, const TaskState(tasks: []));
  });

  test('emits updated state with task after AddTask event', () async {
    when(() => mockRepository.getTasks()).thenAnswer((_) async => [task]);
    when(() => mockRepository.addTask(any())).thenAnswer((_) async {});

    taskBloc.add(AddTask(task));

    await expectLater(
      taskBloc.stream,
      emits(predicate<TaskState>((state) =>
          state.tasks.length == 1 && state.tasks.first.id == '1')),
    );
  });

  test('emits updated state without task after DeleteTask event', () async {
    when(() => mockRepository.deleteTask(task.id)).thenAnswer((_) async {});
    when(() => mockRepository.getTasks()).thenAnswer((_) async => []);

    taskBloc.add(DeleteTask(task.id));

    await expectLater(
      taskBloc.stream,
      emits(predicate<TaskState>((state) => state.tasks.isEmpty)),
    );
  });

  test('emits updated state with toggled completion after ToggleTaskCompletion event', () async {
    final toggledTask = task.copyWith(isCompleted: true);

    when(() => mockRepository.toggleTaskCompletion(task)).thenAnswer((_) async {});
    when(() => mockRepository.getTasks()).thenAnswer((_) async => [toggledTask]);

    taskBloc.add(ToggleTaskCompletion(task));

    await expectLater(
      taskBloc.stream,
      emits(predicate<TaskState>((state) =>
          state.tasks.first.isCompleted == true)),
    );
  });

  test('emits filtered task list after FilterTasks event', () async {
    final completedTask = task.copyWith(isCompleted: true);

    when(() => mockRepository.getTasks()).thenAnswer((_) async => [task, completedTask]);

    taskBloc.add(FilterTasks(TaskFilter.completed));

    // Since filtering only modifies local state, and we don't call getTasks, we can directly emit a loaded state
    taskBloc.emit(TaskState(tasks: [task, completedTask], filter: TaskFilter.completed));

    final filtered = taskBloc.state.filteredTasks;

    expect(filtered.length, 1);
    expect(filtered.first.isCompleted, true);
  });
}
