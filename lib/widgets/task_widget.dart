import 'package:advance_todo_app/provider/add_task_prov.dart';
import 'package:advance_todo_app/utils/helping_functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'expanded_task_dialog.dart';

class TaskWidget extends StatelessWidget {
  final int index;
  const TaskWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _taskList = Provider.of<AddTaskProv>(context).allTasks;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onLongPress: () => showDialog(
            context: context,
            builder: (context) => ExpandedTaskDialog(task: _taskList[index])),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black54.withOpacity(0.05)),
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListTile(
                    title: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(_taskList[index].title,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: Text(
                              priorityEnumToText(_taskList[index].priorityTag)
                                  .toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w300)),
                        ),
                        // const Icon(Icons.music_note_rounded),
                        const Icon(
                          Icons.music_off_rounded,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_taskList[index].description,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w300)),
                        const SizedBox(
                          height: 5,
                        ),
                        // Align(
                        //   alignment: Alignment.bottomRight,
                        //   child: Text(
                        //       DateFormat('dd MMM, y')
                        //           .format(_taskList[index].dateTime),
                        //       style: const TextStyle(
                        //           fontSize: 10, fontWeight: FontWeight.w300)),
                        // )
                      ],
                    )))),
      ),
    );
  }
}
