import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/extensions/space_exs.dart';
import 'package:todo_app/core/utils/colors.dart';
import 'package:todo_app/core/utils/reusable_text.dart';
import 'package:todo_app/feature/task/domain/entities/task.dart';
import 'package:todo_app/feature/task/presentation/bloc/task_event.dart';
import 'package:todo_app/feature/task/presentation/widget/repeated_tex_field.dart';
import 'package:todo_app/feature/task/presentation/widget/task_view_app_bar.dart';

import '../../../../core/utils/strings.dart';
import '../bloc/task_bloc.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  final TextEditingController controller = TextEditingController();
  final TextEditingController descriptionTaskController =
      TextEditingController();

  void _submit() {
    if (controller.text.trim().isEmpty) return;

    final newTask = Task.create(
      title: controller.text.trim(),
      subTitle: descriptionTaskController.text.trim(),
    );

    context.read<TaskBloc>().add(AddTask(newTask));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: TaskViewAppBar(),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buidHeader(textTheme),
                SizedBox(
                  width: double.infinity,
                  // height: ,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      30.s,
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          AppStrings.titleOfTitleTextField,
                          style: textTheme.headlineMedium,
                        ),
                      ),
                      RepeatedTexField(
                        titleTaskController: controller,
                      ),
                      10.s,
                      RepeatedTexField(
                        titleTaskController: descriptionTaskController,
                        isForDescription: true,
                      ),
                    ],
                  ),
                ),
                30.s,
                _buildButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton() {
    return Padding(
      padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
      child: Center(
        child: SizedBox(
          width: 300.w,
          child: MaterialButton(
            key: const Key('123'),
            onPressed: () {
              _submit();
            },
            minWidth: 130,
            color: AppColors.primaryColor,
            height: 35,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: ReuseableText(
                title: AppStrings.addNewTask,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buidHeader(TextTheme textTheme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 70,
          child: Divider(
            thickness: 1.5,
          ),
        ),
        RichText(
          text: TextSpan(
              text: "Add New ",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.grey
                      : Colors.black),
              
              children: [
                TextSpan(
                  text: AppStrings.taskStrnig,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColors.grey
                          : Colors.black),
                )
              ]),
        ),
        SizedBox(
          width: 70,
          child: Divider(
            thickness: 1.5,
          ),
        ),
      ],
    );
  }
}
