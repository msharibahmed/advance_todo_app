import 'package:advance_todo_app/provider/add_task_prov.dart';
import 'package:advance_todo_app/provider/voice_recorder_prov.dart';
import 'package:advance_todo_app/utils/constants.dart';
import 'package:advance_todo_app/widgets/voice_recording_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//
import 'package:advance_todo_app/models/task_model.dart';
import 'package:advance_todo_app/provider/priority_tag_prov.dart';
import 'package:advance_todo_app/widgets/priority_button_widget.dart';

class AddTaskScreen extends StatefulWidget {
  static const routeName = '/add-task-screen';
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final recorder = VoiceRecorderProv();

  @override
  void dispose() {
    super.dispose();
    createTaskCtrl.dispose();
    descriptionCtrl.dispose();
  }

  TextEditingController createTaskCtrl = TextEditingController();
  TextEditingController descriptionCtrl = TextEditingController();
  final _formStateKey = GlobalKey<FormState>();
  Future<void> willPopShowDialog() async {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: const Text(
                'Unsaved changes will be lost!',
                style: TextStyle(fontWeight: FontWeight.w100),
              ),
              actionsAlignment: MainAxisAlignment.spaceEvenly,
              actions: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    child: const Text('close'),
                    onPressed: () {
                      Provider.of<PriorityTagProv>(context, listen: false)
                          .resetTempTask();
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    }),
                ElevatedButton(
                    child: const Text('stay'),
                    onPressed: () => Navigator.pop(context)),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    final _priorityTagProv = Provider.of<PriorityTagProv>(context);
    // print(_priorityTagProv.tempTask.title);
    final _updating = _priorityTagProv.tempTask.title != '';

    // final bool fieldsEmptyCondition =
    //     _priorityTagProv.tempTask.title.trim() == '' &&
    //         _priorityTagProv.tempTask.description.trim() == '';

    return Form(
      key: _formStateKey,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(gradient: backgroundGradient),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  IconButton(
                      onPressed: willPopShowDialog,
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.black54,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: SizedBox(
                      height: 350,
                      child: Image.asset('assets/images/add_task.png'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          initialValue: _updating
                              ? _priorityTagProv.tempTask.title
                              : null,
                          onSaved: (inputText) {
                            _priorityTagProv.addTaskAttributes(
                                title: inputText?.trim());
                          },
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Give task a title';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.sentences,
                          // maxLines: 2,
                          decoration: InputDecoration(
                              hintText: _updating
                                  ? createTaskCtrl.text.isEmpty
                                      ? 'Update task name'
                                      : null
                                  : 'Create new task'),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        TextFormField(
                          initialValue: _updating
                              ? _priorityTagProv.tempTask.description
                              : null,
                          onSaved: (inputText) {
                            _priorityTagProv.addTaskAttributes(
                                description: inputText);
                          },
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.sentences,
                          // maxLines: 10,
                          decoration: InputDecoration(
                              hintText: _updating
                                  ? descriptionCtrl.text.isEmpty
                                      ? 'Description'
                                      : null
                                  : 'Description'),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: const [
                            Text('Add voice note'),
                            VoiceRecordWidget(),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.calendar_today_outlined),
                            label: const Text('Today')),
                        const SizedBox(
                          height: 50,
                        ),
                        const Text(
                          'Set Priority Tag',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _priorityTagProv.addTaskAttributes(
                                    tag: PriorityTag.Urgent);
                              },
                              child: PriorityButtonWidget(
                                  selectedTag:
                                      _priorityTagProv.tempTask.priorityTag,
                                  backgroundColor:
                                      urgentPriority.backgroundColor,
                                  title: urgentPriority.title,
                                  titleColor: urgentPriority.titleColor),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            GestureDetector(
                              onTap: () {
                                _priorityTagProv.addTaskAttributes(
                                    tag: PriorityTag.Regular);
                              },
                              child: PriorityButtonWidget(
                                  selectedTag:
                                      _priorityTagProv.tempTask.priorityTag,
                                  backgroundColor:
                                      regularPriority.backgroundColor,
                                  title: regularPriority.title,
                                  titleColor: regularPriority.titleColor),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            GestureDetector(
                              onTap: () {
                                _priorityTagProv.addTaskAttributes(
                                    tag: PriorityTag.Medium);
                              },
                              child: PriorityButtonWidget(
                                  selectedTag:
                                      _priorityTagProv.tempTask.priorityTag,
                                  backgroundColor:
                                      mediumPriority.backgroundColor,
                                  title: mediumPriority.title,
                                  titleColor: mediumPriority.titleColor),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            if (!_formStateKey.currentState!.validate()) {
              return;
            }
            _formStateKey.currentState!.save();
            if (_updating) {
              Provider.of<AddTaskProv>(context, listen: false)
                  .updateTask(_priorityTagProv.tempTask);
            } else {
              Provider.of<AddTaskProv>(context, listen: false)
                  .createTask(_priorityTagProv.tempTask);
            }

            _priorityTagProv.resetTempTask();
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: const Duration(seconds: 1),
                content:
                    Text('Succesfully' + (_updating ? 'Updated!' : 'added!'))));
          },
          label: Row(
            children: [
              Text(_updating ? 'Update Task' : 'Add Task'),
              const SizedBox(
                width: 5,
              ),
              const Icon(Icons.save_rounded)
            ],
          ),
        ),
      ),
    );
  }
}
