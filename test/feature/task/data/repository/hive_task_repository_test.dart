import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/feature/task/data/models/task_model.dart';
import 'package:todo_app/feature/task/data/repository/hive_task_repository.dart';
import 'package:todo_app/feature/task/domain/entities/task.dart';

class MockTaskBox extends Mock implements Box<TaskModel> {}

class FakeTaskModel extends Fake implements TaskModel {}

void main() {
  late MockTaskBox mockBox;
  late HiveTaskRepository repository;

  setUpAll(() {
    registerFallbackValue(FakeTaskModel()); // ✅ Important!
  });

  setUp(() {
    mockBox = MockTaskBox();
    repository = HiveTaskRepository(box: mockBox);
  });

  final task = Task(
    id: 'abc123',
    title: 'Test Task',
    subTitle: 'Test Subtitle',
    createdAtTime: DateTime(2024, 1, 1),
    createdAtDate: DateTime(2024, 1, 1),
    isCompleted: false,
  );

  test('should add and retrieve task from box', () async {
    when(() => mockBox.put(task.id, any())).thenAnswer((_) async {});
    when(() => mockBox.values).thenReturn([TaskModel.fromEntity(task)]);

    await repository.addTask(task);
    final result = await repository.getTasks();

    expect(result.length, 1);
    expect(result.first.title, 'Test Task');
    verify(() => mockBox.put(task.id, any())).called(1);
    verify(() => mockBox.values).called(1);
  });

  test('should delete task by id', () async {
    when(() => mockBox.delete(task.id)).thenAnswer((_) async {});
    await repository.deleteTask(task.id);
    verify(() => mockBox.delete(task.id)).called(1);
  });

  test('should update task', () async {
    final updated = task.copyWith(title: 'Updated Task');
    when(() => mockBox.put(updated.id, any())).thenAnswer((_) async {});
    await repository.updateTask(updated);
    verify(() => mockBox.put(updated.id, any())).called(1);
  });

  test('should toggle completion', () async {
    final toggled = task.copyWith(isCompleted: !task.isCompleted);
    when(() => mockBox.put(toggled.id, any())).thenAnswer((_) async {});
    await repository.toggleTaskCompletion(task);
    verify(() => mockBox.put(toggled.id, any())).called(1);
  });
}
