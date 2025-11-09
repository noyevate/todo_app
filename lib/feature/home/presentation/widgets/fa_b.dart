import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/colors.dart';
import 'package:todo_app/feature/task/presentation/pages/add_task_page.dart';

class FaB extends StatelessWidget {
  const FaB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      key: Key('addTaskFab'),
      onPressed: () {
        Navigator.push(
          context,
          CupertinoPageRoute(builder: (_) => TaskView()),
        );
      },
      child: Material(
        borderRadius: BorderRadius.circular(15),
        elevation: 20,
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
