import 'package:flutter/material.dart';
//
import 'package:advance_todo_app/models/task_model.dart';

class PriorityButtonWidget extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color titleColor;
  final PriorityTag selectedTag;

  const PriorityButtonWidget({
    required this.selectedTag,
    required this.backgroundColor,
    required this.title,
    required this.titleColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool tagBool = selectedTag.toString().contains(title.substring(1));
    return Stack(
      children: [
        Card(
          elevation: tagBool?5:0,
          color: backgroundColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child: Text(
              title,
              style: TextStyle(
                  color: titleColor, fontWeight: FontWeight.w400, fontSize: 16),
            ),
          ),
        ),
        if (tagBool)
          CircleAvatar(
              backgroundColor: titleColor,
              radius: 8,
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 15,
              )),
      ],
    );
  }
}
