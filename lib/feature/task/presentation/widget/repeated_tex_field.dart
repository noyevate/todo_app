import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/colors.dart';

import '../../../../core/utils/strings.dart';

class RepeatedTexField extends StatelessWidget {
  const RepeatedTexField({
    super.key,
    required this.titleTaskController,
    this.isForDescription = false,
  });

  final TextEditingController titleTaskController;
  final bool isForDescription;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: TextFormField(
          key: const Key('123'),
          controller: titleTaskController,
          maxLines: !isForDescription ? 6 : null,
          cursorHeight: !isForDescription ? 40 : null,
          style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? const Color.fromARGB(255, 203, 189, 189)
                  : Colors.black),
          decoration: InputDecoration(
            border: isForDescription ? InputBorder.none : null,
            counter: Container(),
            hintText: isForDescription ? AppStrings.addNote : null,
            prefixIcon: isForDescription
                ? Icon(
                    Icons.bookmark_border,
                    color: Colors.grey,
                  )
                : null,
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300)),
          ),
          onFieldSubmitted: (value) {},
          onChanged: (value) {},
        ),
      ),
    );
  }
}
