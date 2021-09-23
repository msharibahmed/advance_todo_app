import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  static const routeName = '/add-task-screen';
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue.withOpacity(0.1),
                Colors.white38.withOpacity(0.2)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
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
                    icon: const Icon(Icons.arrow_back_ios_new_rounded)),
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
                        decoration:
                            const InputDecoration(hintText: 'Create new task'),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      TextFormField(
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
                          PriorityButtonWidget(
                              backgroundColor: const Color(0xfffff3e0),
                              title: 'Urgent',
                              titleColor:
                                  Colors.orangeAccent[200] ?? Colors.black),
                          const SizedBox(
                            width: 25,
                          ),
                          PriorityButtonWidget(
                              backgroundColor:
                                  Colors.indigo[100] ?? Colors.black,
                              title: 'Regular',
                              titleColor:
                                  Colors.indigoAccent[200] ?? Colors.black),
                          const SizedBox(
                            width: 25,
                          ),
                          PriorityButtonWidget(
                              backgroundColor:
                                  Colors.green[100] ?? Colors.black,
                              title: 'Medium',
                              titleColor: Colors.green[300] ?? Colors.black),
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
        onPressed: () => Navigator.pushNamed(context, AddTaskScreen.routeName),
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

class PriorityButtonWidget extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color titleColor;

  const PriorityButtonWidget({
    required this.backgroundColor,
    required this.title,
    required this.titleColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 0,
          color: backgroundColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child: Text(
              title,
              style: TextStyle(
                  color: titleColor, fontWeight: FontWeight.w400, fontSize: 16),
            ),
          ),
        ),
        CircleAvatar(
            backgroundColor: titleColor,
            radius: 8,
            child: const Icon(
              Icons.check,
              color: Colors.white,
              size: 15,
            )),
      ],
    );
  }
}
