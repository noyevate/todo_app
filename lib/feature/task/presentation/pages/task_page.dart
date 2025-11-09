import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/extensions/space_exs.dart';
import 'package:todo_app/core/utils/format_time.dart';
import 'package:todo_app/core/utils/strings.dart';
import 'package:todo_app/feature/task/domain/entities/task.dart';
import 'package:todo_app/feature/task/presentation/pages/update_task.dart';
import 'package:todo_app/feature/task/presentation/widget/task_page_app_bar.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/reusable_text.dart';

class TaskPage extends StatefulWidget {
  final Task task;
  const TaskPage({super.key, required this.task});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TaskPageAppBar(
        task: widget.task,
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 500.w,
                    child: Text(
                      widget.task.title,
                      style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? AppColors.grey
                            : AppColors.darkgrey,
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Metropolis',
                      ),
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                  ),

                  // IconButton(onPressed: (){}, icon: Icon(Ico))
                ],
              ),
            ),
            20.s,
            AnimatedContainer(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(.1),
                          offset: const Offset(0, 4),
                          blurRadius: 10)
                    ]),
                duration: const Duration(milliseconds: 600),
                child: ListTile(
                  // leading: GestureDetector(
                  //   onTap: () {
                  //     //  context.read<TaskBloc>().add(ToggleTaskCompletion(task));
                  //     // check or uncheck the task
                  //   },
                  //   child: AnimatedContainer(
                  //     duration: const Duration(milliseconds: 600),
                  //     decoration: BoxDecoration(
                  //         color:  Colors.white,
                  //         shape: BoxShape.circle,
                  //         border: Border.all(
                  //             color: Colors.grey, width: .8)),
                  //     child:  Icon(
                  //       Icons.check,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                  // title: ReuseableText(
                  //   title: task.title.toString(),
                  //   style: TextStyle(
                  //       color: Theme.of(context).brightness == Brightness.dark ? AppColors.grey: Colors.black,
                  //       fontSize: 15,
                  //       fontWeight: FontWeight.w500,
                  //       decoration: TextDecoration.lineThrough),
                  // ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.task.subTitle,
                        style: TextStyle(
                            fontFamily: 'Metropolis',
                            color: AppColors.darkgrey,
                            fontWeight: FontWeight.w300),
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 5, top: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ReuseableText(
                                title: formatDateTime(widget.task.createdAtDate,
                                    includeTime: true),
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                              ReuseableText(
                                title: "Completed",
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),),
                20.s,
                Center(
                  child: SizedBox(
                    width: 300.w,
                    child: MaterialButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateSingleTask(task: widget.task,)));
                                },
                                minWidth: 130,
                                color: AppColors.primaryColor,
                                height: 35,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: ReuseableText(
                                    title: AppStrings.updateCurrentTask,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
