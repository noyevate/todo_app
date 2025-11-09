import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/extensions/space_exs.dart';
import 'package:todo_app/core/utils/colors.dart';
import 'package:todo_app/core/utils/reusable_text.dart';
import 'package:todo_app/core/utils/size.dart';
import 'package:todo_app/feature/choose_mode/presentation/bloc/theme_event.dart';
import 'package:todo_app/feature/home/presentation/pages/home.dart';

import '../bloc/theme_bloc.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.all(20),
      height: height,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ReuseableText(
              title: "Choose Mode",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).brightness == Brightness.dark
        ? AppColors.grey
        : AppColors.darkgrey,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    context.read<ThemeBloc>().add(ToggleToLight());
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeView(),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 300.h,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.grey),
                        child: Icon(
                          Icons.light_mode,
                          size: 200.sp,
                        ),
                      ),
                      // 10.s,
                      ReuseableText(
                        title: "Light Mode",
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.read<ThemeBloc>().add(ToggleToDark());
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeView(),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 300.h,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.grey),
                        child: Icon(
                          Icons.dark_mode,
                          size: 200.sp,
                        ),
                      ),
                      ReuseableText(
                        title: "Dark Mode",
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
