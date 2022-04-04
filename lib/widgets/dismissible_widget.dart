import 'package:advance_todo_app/provider/priority_tag_prov.dart';
import 'package:advance_todo_app/screens/add_task_screen.dart';
import 'package:advance_todo_app/widgets/task_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//
import 'package:advance_todo_app/provider/add_task_prov.dart';

class DismissibleWidget extends StatelessWidget {
  final int index;
  const DismissibleWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _addTaskProv = Provider.of<AddTaskProv>(context);
    return Dismissible(
      key: Key(_addTaskProv.allTasks[index].id),
      dismissThresholds: const {
        DismissDirection.endToStart: 0.4,
        DismissDirection.startToEnd: 0.4,
      },
      background: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.red.withOpacity(0.8)),
        child: const Align(
            alignment: Alignment.centerLeft,
            child: Icon(
              Icons.delete,
              size: 30,
            )),
      ),
      secondaryBackground: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.green.withOpacity(0.8)),
        child: const Align(
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.upload_rounded,
              size: 30,
            )),
      ),
      child: TaskWidget(index: index),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          return showDeletionAlertDialog(context);
        } else if (direction == DismissDirection.endToStart) {
          var _task = _addTaskProv.allTasks[index];

          Provider.of<PriorityTagProv>(context,listen: false).addTaskAttributes(
              id: _task.id,
              title: _task.title,
              description: _task.description,
              voiceNote: _task.voiceNotePath,
              tag: _task.priorityTag,
              dateTime: _task.dateTime);
          Navigator.pushNamed(context, AddTaskScreen.routeName);
        }
      },
      onDismissed: (direction) {
        if (direction == DismissDirection.startToEnd) {
          _addTaskProv.deleteTask(_addTaskProv.allTasks[index].id);
          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                duration: Duration(seconds: 1),
                                content: Text('Succesfully deleted!')));
        }
      },
    );
  }

  Future<bool> showDeletionAlertDialog(BuildContext context) async {
    bool confirmResult = false;

    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: const Text('Are you sure you wanna delete?'),
              actionsAlignment: MainAxisAlignment.spaceEvenly,
              actions: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    onPressed: () {
                      confirmResult = true;
                      Navigator.pop(context);
                    },
                    child: const Text('yes')),
                ElevatedButton(
                    onPressed: () {
                      confirmResult = false;
                      Navigator.pop(context);
                    },
                    child: const Text('no')),
              ],
            ));
    return confirmResult;
  }
}
