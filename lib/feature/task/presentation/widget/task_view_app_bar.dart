import 'package:flutter/material.dart';

class TaskViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  
  const TaskViewAppBar({super.key});

  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 130,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios_new_outlined)
            )
          ],
        ),
      ),
    );
  }

  
  
  @override
  Size get preferredSize => const Size.fromHeight(150);
}