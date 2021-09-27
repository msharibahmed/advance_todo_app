import 'package:advance_todo_app/models/task_model.dart';
import 'package:advance_todo_app/utils/constants.dart';
import 'package:advance_todo_app/widgets/priority_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpandedTaskDialog extends StatelessWidget {
  final TaskModel task;
  const ExpandedTaskDialog({Key? key, required this.task}) : super(key: key);
  PriorityButtonWidget _priorityWidegt() {
    final priorityString = task.priorityTag.toString().substring(12);

    if (priorityString == regularPriority.title) {
      return PriorityButtonWidget(
          selectedTag: task.priorityTag,
          backgroundColor: regularPriority.backgroundColor,
          title: regularPriority.title,
          titleColor: regularPriority.titleColor);
    } else if (priorityString == mediumPriority.title) {
      return PriorityButtonWidget(
          selectedTag: task.priorityTag,
          backgroundColor: mediumPriority.backgroundColor,
          title: mediumPriority.title,
          titleColor: mediumPriority.titleColor);
    }
    return PriorityButtonWidget(
        selectedTag: task.priorityTag,
        backgroundColor: urgentPriority.backgroundColor,
        title: urgentPriority.title,
        titleColor: urgentPriority.titleColor);
  }

  @override
  Widget build(BuildContext context) {
    final _mq = MediaQuery.of(context).size;
    return Padding(
      padding:const EdgeInsets.symmetric( horizontal: 50),
      child: Center(
        child: SingleChildScrollView(
          child: Container(constraints: BoxConstraints( minHeight:  _mq.height /5),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [
                Row(
                  children: [
                    Text(DateFormat('dd').format(task.dateTime),
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500)),
                    Text(DateFormat('MMM, y').format(task.dateTime),
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400)),
                  ],
                ),
                const SizedBox(height: 20),
                const TaskFieldHeading(text: 'Task Name'),
                Text(task.title,
                    style:
                        const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                const SizedBox(
                  height: 20,
                ),
                const TaskFieldHeading(text: 'Task Description'),
                Text(task.description ==''?'-':task.description ,
                    style:
                        const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                const SizedBox(
                  height: 20,
                ),
                const TaskFieldHeading(text: 'Task Priority'),
                _priorityWidegt(),
                const SizedBox(
                  height: 20,
                ),
                const TaskFieldHeading(text: 'Voice Note'),
                const Icon(Icons.music_note_rounded),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Delete'),
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Update'),
                      style: ElevatedButton.styleFrom(primary: Colors.blue),
                    ),
                    ElevatedButton(onPressed: () {}, child: const Text('Close')),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TaskFieldHeading extends StatelessWidget {
  final String text;
  const TaskFieldHeading({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2.0),
      child: Text(text,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
    );
  }
}
