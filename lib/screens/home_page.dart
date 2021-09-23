import 'package:flutter/material.dart';
//
import 'add_task_screen.dart';
import 'home_screen.dart';
import 'drawer_screen.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home-page';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () =>
              Navigator.pushNamed(context, AddTaskScreen.routeName),
          label: Row(
            children: const [
              Text('New Task'),
              SizedBox(
                width: 5,
              ),
              Icon(Icons.add)
            ],
          ),
        ),
        body: Stack(
          children: const [DrawerScreen(), HomeScreen()],
        ));
  }
}
