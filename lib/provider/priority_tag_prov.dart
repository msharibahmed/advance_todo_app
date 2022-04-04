import 'package:advance_todo_app/models/task_model.dart';
import 'package:flutter/material.dart';

class PriorityTagProv with ChangeNotifier {
  TaskModel tempTask = TaskModel(
      id: DateTime.now().toIso8601String(),
      title: '',
      description: '',
      voiceNotePath: '',
      dateTime: DateTime.now(),
      priorityTag: PriorityTag.Regular);

  void addTaskAttributes({
    String? id,
    String? title,
    String? description,
    String? voiceNote,
    DateTime? dateTime,
    PriorityTag? tag,
  }) {
    tempTask = TaskModel(
        id: id ?? tempTask.id,
        title: title ?? tempTask.title,
        description: description ?? tempTask.description,
        voiceNotePath: voiceNote ?? tempTask.voiceNotePath,
        dateTime: dateTime ?? tempTask.dateTime,
        priorityTag: tag ?? tempTask.priorityTag);
    notifyListeners();
  }

  void resetTempTask() {
    tempTask = TaskModel(
        id: DateTime.now().toIso8601String(),
        title: '',
        description: '',
        voiceNotePath: '',
        dateTime: DateTime.now(),
        priorityTag: PriorityTag.Regular);
  }
}
