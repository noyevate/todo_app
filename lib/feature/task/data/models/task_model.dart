import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import '../../domain/entities/task.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String subTitle;
  @HiveField(3)
  final DateTime createdAtTime;
  @HiveField(4)
  final DateTime createdAtDate;
  @HiveField(5)
  final bool isCompleted;

  TaskModel({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.createdAtTime,
    required this.createdAtDate,
    required this.isCompleted,
  });

  factory TaskModel.create({
    String? title,
    String? subTitle,
    DateTime? createdAtTime,
    DateTime? createdAtDate,
  }) =>
      TaskModel(
        id: const Uuid().v1(),
        title: title ?? '',
        subTitle: subTitle ?? '',
        createdAtTime: createdAtTime ?? DateTime.now(),
        createdAtDate: createdAtDate ?? DateTime.now(),
        isCompleted: false,
      );

  Task toEntity() => Task(
        id: id,
        title: title,
        subTitle: subTitle,
        createdAtTime: createdAtTime,
        createdAtDate: createdAtDate,
        isCompleted: isCompleted,
      );

  static TaskModel fromEntity(Task task) => TaskModel(
        id: task.id,
        title: task.title,
        subTitle: task.subTitle,
        createdAtTime: task.createdAtTime,
        createdAtDate: task.createdAtDate,
        isCompleted: task.isCompleted,
      );
}