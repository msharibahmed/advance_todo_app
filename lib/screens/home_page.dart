import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//
import 'add_task_screen.dart';
import 'home_screen.dart';
import 'drawer_screen.dart';
//
import 'package:advance_todo_app/provider/priority_tag_prov.dart';

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
          children: const [
            DrawerScreen(),
            HomeScreen(),
          ],
        ));
  }
}
