import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/feature/task/domain/entities/task.dart';

void main() {
  group('Task Entity', () {
    test('copyWith should return updated task while keeping other values', () {
      final original = Task(
        id: 'abc123',
        title: 'Original Title',
        subTitle: 'Original Subtitle',
        createdAtDate: DateTime(2024, 1, 1),
        createdAtTime: DateTime(2024, 1, 1, 10),
        isCompleted: false,
      );

      final updated = original.copyWith(title: 'Updated Title');

      expect(updated.id, original.id);
      expect(updated.title, 'Updated Title');
      expect(updated.subTitle, original.subTitle);
      expect(updated.createdAtDate, original.createdAtDate);
      expect(updated.isCompleted, original.isCompleted);
    });
  });
}
