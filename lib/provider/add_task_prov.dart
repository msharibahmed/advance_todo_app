import 'package:advance_todo_app/models/task_model.dart';
import 'package:flutter/cupertino.dart';

class AddTaskProv with ChangeNotifier {
  final List<TaskModel> _allTasks = [];
  List<TaskModel> get allTasks {
    return [..._allTasks];
  }

  void updateTask(TaskModel task) {
    int _index = _allTasks.indexWhere((element) => element.id == task.id);
    _allTasks[_index] = task;

    notifyListeners();
  }

  void createTask(TaskModel task) {
    _allTasks.add(task);
    notifyListeners();
  }

  void deleteTask(String id) {
    _allTasks.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
