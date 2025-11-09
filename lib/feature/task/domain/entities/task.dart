import 'package:uuid/uuid.dart';

class Task {
  final String id;
  final String title;
  final String subTitle;
  final DateTime createdAtTime;
  final DateTime createdAtDate;
  final bool isCompleted;

  const Task({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.createdAtTime,
    required this.createdAtDate,
    required this.isCompleted,
  });

  factory Task.create({
  required String title,
  required String subTitle,
  DateTime? createdAtTime,
  DateTime? createdAtDate,
}) {
  return Task(
    id: const Uuid().v1(),
    title: title,
    subTitle: subTitle,
    createdAtTime: createdAtTime ?? DateTime.now(),
    createdAtDate: createdAtDate ?? DateTime.now(),
    isCompleted: false,
  );
}


  Task copyWith({
    String? id,
    String? title,
    String? subTitle,
    DateTime? createdAtTime,
    DateTime? createdAtDate,
    bool? isCompleted,
  }) =>
      Task(
        id: id ?? this.id,
        title: title ?? this.title,
        subTitle: subTitle ?? this.subTitle,
        createdAtTime: createdAtTime ?? this.createdAtTime,
        createdAtDate: createdAtDate ?? this.createdAtDate,
        isCompleted: isCompleted ?? this.isCompleted,
      );
}