// ignore_for_file: constant_identifier_names
enum PriorityTag { Regular,Medium, Urgent }

class TaskModel {
  final String id;
  final String title;
  final String description;
  final String voiceNote;
  final DateTime dateTime;
  final PriorityTag priorityTag;
  TaskModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.voiceNote,
      required this.dateTime,
      required this.priorityTag});
}
