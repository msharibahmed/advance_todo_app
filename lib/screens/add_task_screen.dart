import 'package:advance_todo_app/utils/constants.dart';
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

TextEditingController createTaskCtrl = TextEditingController();
TextEditingController descriptionCtrl = TextEditingController();

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    final _priorityTagProv = Provider.of<PriorityTagProv>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: backgroundGradient
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                IconButton(
                    onPressed: () => Navigator.pop(context),
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
                        onSaved: (inputText) {},
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.sentences,
                        // maxLines: 2,
                        decoration:
                            const InputDecoration(hintText: 'Create new task'),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      TextFormField(
                        onSaved: (inputText) {},
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.sentences,
                        // maxLines: 10,
                        decoration:
                            const InputDecoration(hintText: 'Description'),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: const [
                          Text('Add voice note'),
                          Icon(Icons.mic_none_sharp)
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
                              Provider.of<PriorityTagProv>(context)
                                  .changePriorityTag(tag: PriorityTag.urgent);
                            },
                            child: PriorityButtonWidget(
                                selectedTag:
                                    _priorityTagProv.tempTask.priorityTag,
                                backgroundColor: const Color(0xfffff3e0),
                                title: 'Urgent',
                                titleColor:
                                    Colors.orangeAccent[200] ?? Colors.black),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          GestureDetector(
                            onTap: () {
                              Provider.of<PriorityTagProv>(context)
                                  .changePriorityTag(tag: PriorityTag.regular);
                            },
                            child: PriorityButtonWidget(
                                selectedTag:
                                    _priorityTagProv.tempTask.priorityTag,
                                backgroundColor:
                                    Colors.indigo[100] ?? Colors.black,
                                title: 'Regular',
                                titleColor:
                                    Colors.indigoAccent[200] ?? Colors.black),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          GestureDetector(
                            onTap: () {
                              Provider.of<PriorityTagProv>(context)
                                  .changePriorityTag(tag: PriorityTag.medium);
                            },
                            child: PriorityButtonWidget(
                                selectedTag:
                                    _priorityTagProv.tempTask.priorityTag,
                                backgroundColor:
                                    Colors.green[100] ?? Colors.black,
                                title: 'Medium',
                                titleColor: Colors.green[300] ?? Colors.black),
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
        onPressed: () {},
        label: Row(
          children: const [
            Text('Add Task'),
            SizedBox(
              width: 5,
            ),
            Icon(Icons.save_rounded)
          ],
        ),
      ),
    );
  }
}
