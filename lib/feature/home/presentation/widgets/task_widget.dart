import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todo_app/core/utils/colors.dart';
import 'package:todo_app/core/utils/format_time.dart';
import 'package:todo_app/core/utils/reusable_text.dart';
import 'package:todo_app/feature/task/domain/entities/task.dart';
import 'package:todo_app/feature/task/presentation/bloc/task_bloc.dart';
import 'package:todo_app/feature/task/presentation/bloc/task_event.dart';
import 'package:todo_app/feature/task/presentation/pages/task_page.dart';

class TaskWidget extends StatelessWidget {
  final Task task;
  const TaskWidget({
    super.key, required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => TaskPage(task: task,)));
      },
      child: AnimatedContainer(
          margin:
              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
              color: task.isCompleted? AppColors.primaryColor.withOpacity(0.3) : Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    offset: const Offset(0, 4),
                    blurRadius: 10)
              ]),
          duration: const Duration(milliseconds: 600),
          child: ListTile(
            leading: GestureDetector(
              onTap: () {
                 context.read<TaskBloc>().add(ToggleTaskCompletion(task));
                // check or uncheck the task
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 600),
                decoration: BoxDecoration(
                    color: task.isCompleted  ? AppColors.primaryColor : Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Colors.grey, width: .8)),
                child:  Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
            ),
            title: ReuseableText(
              title: task.title.toString(),
              style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark ? AppColors.grey: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.lineThrough),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReuseableText(
                  title: task.subTitle,
                  style: TextStyle(
                      color: task.isCompleted ?AppColors.grey:  AppColors.darkgrey,
                      fontWeight: FontWeight.w300),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 5, top: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ReuseableText(
                          title: formatDateTime(task.createdAtDate, includeTime: true),
                          style: TextStyle(
                              fontSize: 12, color: Colors.grey),
                        ),
                    
                        // ReuseableText(
                        //   title: "subDate",
                        //   style: TextStyle(
                        //       fontSize: 12, color: Colors.grey),
                        // ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
