import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/core/extensions/space_exs.dart';
import 'package:todo_app/core/utils/constanst.dart';
import 'package:todo_app/core/utils/reusable_text.dart';
import 'package:todo_app/core/utils/strings.dart';
import 'package:todo_app/feature/home/presentation/widgets/fa_b.dart';
import 'package:todo_app/feature/task/presentation/bloc/task_bloc.dart';
import 'package:todo_app/feature/task/presentation/bloc/task_event.dart';
import 'package:todo_app/feature/task/presentation/bloc/task_state.dart';

import '../../../../core/utils/colors.dart';
import '../widgets/task_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TaskBloc>(context).add(LoadTasks());
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      floatingActionButton: FaB(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: _homebody(textTheme, context),
    );
  }

  Widget _homebody(TextTheme textTheme, BuildContext context) {
  final taskBloc = context.watch<TaskBloc>();
  final sortOrder = taskBloc.state.sortOrder;

  return SafeArea(
    child: LayoutBuilder(
      builder: (context, constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(maxHeight: constraints.maxHeight),
          child: Column(
            children: [
              20.s,

              // Header Row
              Container(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        value: 1 / 3,
                        backgroundColor: Colors.grey,
                        valueColor: AlwaysStoppedAnimation(AppColors.primaryColor),
                      ),
                    ),
                    25.l, 
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.mainTitle,
                          style: TextStyle(
                            color: Theme.of(context).brightness == Brightness.dark
                                ? AppColors.grey
                                : AppColors.darkgrey,
                            fontSize: 45,
                          ),
                        ),
                        3.s,
                        // Text(
                        //   "1 of 3",
                        //   style: textTheme.titleMedium,
                        // )
                      ],
                    )
                  ],
                ),
              ),

              // Filters and Sort
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: TaskFilter.values.map((filter) {
                        final isSelected = filter == taskBloc.state.filter;
                        final label = {
                          TaskFilter.all: "All",
                          TaskFilter.active: "Active",
                          TaskFilter.completed: "Completed",
                        }[filter]!;

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: GestureDetector(
                            onTap: () {
                              context.read<TaskBloc>().add(FilterTasks(filter));
                            },
                            child: Text(
                              label,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                color: isSelected
                                    ? Theme.of(context).primaryColor
                                    : Theme.of(context).textTheme.bodyMedium!.color,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<TaskBloc>().add(ToggleSortOrder());
                      },
                      icon: Icon(
                        sortOrder == SortOrder.newestFirst
                            ? Icons.arrow_downward
                            : Icons.arrow_upward,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      tooltip: "Sort by Date",
                    ),
                  ],
                ),
              ),

              Divider(thickness: 2, indent: 80),

              /// ✅ Task List — Expanded to fill remaining height
              Expanded(
                child: BlocBuilder<TaskBloc, TaskState>(
                  builder: (context, state) {
                    final filteredTasks = state.filteredTasks;

                    if (filteredTasks.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FadeInUp(
                              child: SizedBox(
                                height: 180,
                                width: 180,
                                child: LottieBuilder.asset(
                                  lottieURL,
                                  animate: true,
                                ),
                              ),
                            ),
                            FadeInUp(
                              from: 30,
                              child: ReuseableText(
                                title: AppStrings.doneAllTask,
                                style: const TextStyle(),
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return ListView.builder(
                      itemCount: filteredTasks.length,
                      itemBuilder: (context, index) {
                        final task = filteredTasks[index];
                        return Dismissible(
                          key: Key(task.id),
                          direction: DismissDirection.horizontal,
                          onDismissed: (_) {
                            Future.delayed(const Duration(milliseconds: 1000), () {
                              context.read<TaskBloc>().add(DeleteTask(task.id));
                            });
                          },
                          background: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.delete_forever, color: Colors.grey),
                              5.l,
                              ReuseableText(
                                title: AppStrings.deleteTask,
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          child: TaskWidget(task: task),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}
}



  // Widget _homebody(TextTheme textTheme, BuildContext context) {
  //   return SizedBox(
  //     width: double.infinity,
  //     height: double.infinity,
  //     child: Column(
  //       children: [
  //         70.s,
  //         Container(
  //           height: 80,
  //           // margin: EdgeInsets.only(top: 10),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               SizedBox(
  //                 height: 20,
  //                 width: 20,
  //                 child: CircularProgressIndicator(
  //                   value: 1 / 3,
  //                   backgroundColor: Colors.grey,
  //                   valueColor: AlwaysStoppedAnimation(AppColors.primaryColor),
  //                 ),
  //               ),
  //               // Padding(
  //               //   padding: const EdgeInsets.symmetric(vertical: 10),
  //               //   child: Row(
  //               //     mainAxisAlignment: MainAxisAlignment.center,
  //               //     children: TaskFilter.values.map((filter) {
  //               //       final isSelected = filter == currentFilter;
  //               //       final label = {
  //               //         // TaskFilter.all: "All",
  //               //         // TaskFilter.active: "Active",
  //               //         // TaskFilter.completed: "Completed"
  //               //         "All",
  //               //         "Active",
  //               //         "Completed"
  //               //       }[filter];

  //               //       return Padding(
  //               //         padding: const EdgeInsets.symmetric(horizontal: 8),
  //               //         child: GestureDetector(
  //               //           onTap: () {
  //               //             context.read<TaskBloc>().add(FilterTasks(filter));
  //               //           },
  //               //           child: Text(
  //               //             label!,
  //               //             style: TextStyle(
  //               //               fontSize: 16,
  //               //               fontWeight: isSelected
  //               //                   ? FontWeight.bold
  //               //                   : FontWeight.normal,
  //               //               color: isSelected
  //               //                   ? Theme.of(context).primaryColor
  //               //                   : Theme.of(context)
  //               //                       .textTheme
  //               //                       .bodyMedium!
  //               //                       .color,
  //               //             ),
  //               //           ),
  //               //         ),
  //               //       );
  //               //     }).toList(),
  //               //   ),
  //               // ),
  //               25.l,
  //               Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     AppStrings.mainTitle,
  //                     style: TextStyle(
  //                         color: Theme.of(context).brightness == Brightness.dark
  //                             ? AppColors.grey
  //                             : AppColors.darkgrey,
  //                         fontSize: 45),
  //                   ),
  //                   3.s,
  //                   Text(
  //                     "1 of 3",
  //                     style: textTheme.titleMedium,
  //                   )
  //                 ],
  //               )
  //             ],
  //           ),
  //         ),
  //         Padding(
  //           padding: EdgeInsets.only(top: 5),
  //           child: Divider(
  //             thickness: 2,
  //             indent: 80,
  //           ),
  //         ),
  //         BlocBuilder<TaskBloc, TaskState>(
  //           builder: (context, state) {
  //             final tasks = state.tasks;
  //             if (tasks.isEmpty) {
  //               return Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   FadeInUp(
  //                     child: SizedBox(
  //                         height: 180,
  //                         width: 180,
  //                         child: LottieBuilder.asset(
  //                           lottieURL,
  //                           animate: tasks.isNotEmpty ? false : true,
  //                         )),
  //                   ),
  //                   FadeInUp(
  //                     from: 30,
  //                     child: ReuseableText(
  //                       title: AppStrings.doneAllTask,
  //                       style: TextStyle(),
  //                     ),
  //                   )
  //                 ],
  //               );
  //             }
  //             return Expanded(
  //                 child: ListView.builder(
  //               itemCount: tasks.length,
  //               scrollDirection: Axis.vertical,
  //               itemBuilder: (context, index) {
  //                 var task = state.tasks[index];
  //                 return Dismissible(
  //                   key: Key(task.id),
  //                   direction: DismissDirection.horizontal,
  //                   onDismissed: (_) {
  //                     // remove the task
  //                     Future.delayed(const Duration(milliseconds: 1000), () {
  //                       context.read<TaskBloc>().add(DeleteTask(task.id));
  //                     });
  //                   },
  //                   background: Row(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
  //                       Icon(
  //                         Icons.delete_forever,
  //                         color: Colors.grey,
  //                       ),
  //                       5.l,
  //                       ReuseableText(
  //                         title: AppStrings.deleteTask,
  //                         style: TextStyle(color: Colors.grey),
  //                       )
  //                     ],
  //                   ),
              
  //                   child: TaskWidget(
  //                     task: task,
  //                   ),
  //                 );
  //               },
  //             ));
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }

  