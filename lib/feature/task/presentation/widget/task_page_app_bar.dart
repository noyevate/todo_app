import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/feature/task/domain/entities/task.dart';
import 'package:todo_app/feature/home/presentation/pages/home.dart';
import 'package:todo_app/feature/task/presentation/bloc/task_bloc.dart';
import 'package:todo_app/feature/task/presentation/bloc/task_event.dart';

class TaskPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Task task;
  const TaskPageAppBar({super.key, required this.task});

  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 130,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios_new_outlined)),
            GestureDetector(
              onTap: () {
                context.read<TaskBloc>().add(DeleteTask(task.id));
                Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => HomeView())); 
              },
              child: Icon(Icons.delete_outline_sharp))
          ],
        ),
      ),
    );
  }

  
  
  @override
  Size get preferredSize => const Size.fromHeight(150);
}