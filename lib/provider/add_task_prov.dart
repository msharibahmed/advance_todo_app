import 'package:advance_todo_app/models/task_model.dart';
import 'package:flutter/cupertino.dart';

class AddTaskProv with ChangeNotifier {
  final List<TaskModel> _allTasks = [];
  List<TaskModel> get allTasks {
    return [..._allTasks];
  }

  void updateTask(TaskModel task) {}
  void createTask(TaskModel task) {
    _allTasks.add(task);
    notifyListeners(); 
  }

  void deleteTask(TaskModel task) {}
}
