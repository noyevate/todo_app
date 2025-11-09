import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app/feature/task/domain/entities/task.dart';
import 'package:todo_app/feature/task/domain/repositories/task_repository.dart';
import 'package:todo_app/feature/task/domain/usecases/add_task_usecase.dart';
import 'package:todo_app/feature/task/domain/usecases/update_task_usecase.dart';

class MockTaskRepository extends Mock implements TaskRepository {}

class FakeTask extends Fake implements Task {}

void main() {
  late MockTaskRepository mockRepository;
  late AddTaskUseCase addTaskUseCase;
  late UpdateTaskUseCase updateTaskUseCase;
  final sampleTask = Task(
    id: '1',
    title: 'Sample Task',
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
    addTaskUseCase = AddTaskUseCase(mockRepository);
    updateTaskUseCase = UpdateTaskUseCase(mockRepository);
  });

  test('AddTaskUseCase calls repository.addTask with correct task', () async {
    when(() => mockRepository.addTask(any())).thenAnswer((_) async {});
    await addTaskUseCase.call(sampleTask);
    verify(() => mockRepository.addTask(sampleTask)).called(1);
  });

  test('UpdateTaskUseCase calls repository.updateTask with correct task', () async {
    when(() => mockRepository.updateTask(any())).thenAnswer((_) async {});
    await updateTaskUseCase.call(sampleTask);
    verify(() => mockRepository.updateTask(sampleTask)).called(1);
  });
}
