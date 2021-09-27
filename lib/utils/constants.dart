import 'package:advance_todo_app/widgets/priority_button_widget.dart';
import 'package:flutter/material.dart';

Color darkbackgroundColor = Colors.blue.withOpacity(0.3);

//blue background gradient
LinearGradient backgroundGradient = LinearGradient(
  colors: [Colors.blue.withOpacity(0.1), Colors.white38.withOpacity(0.2)],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

class PriorityButtonAttributes {
  final String title;
  final Color backgroundColor;
  final Color titleColor;
  PriorityButtonAttributes(
      {required this.title,
      required this.titleColor,
      required this.backgroundColor});
}

PriorityButtonAttributes regularPriority = PriorityButtonAttributes(
    title: 'Regular',
    titleColor: Colors.indigoAccent[200] ?? Colors.black,
    backgroundColor: Colors.indigo[100] ?? Colors.black);
PriorityButtonAttributes mediumPriority = PriorityButtonAttributes(
  title: 'Medium',
  titleColor: Colors.green[300] ?? Colors.black,
  backgroundColor: Colors.green[100] ?? Colors.black,
);
PriorityButtonAttributes urgentPriority = PriorityButtonAttributes(
  title: 'Urgent',
  titleColor: Colors.orangeAccent[200] ?? Colors.black,
  backgroundColor: const Color(0xfffff3e0),
);
