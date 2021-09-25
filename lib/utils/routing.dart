import 'package:flutter/material.dart';
//
import 'package:advance_todo_app/screens/add_task_screen.dart';
import 'package:advance_todo_app/screens/drawer_screen.dart';
import 'package:advance_todo_app/screens/home_page.dart';
import 'package:advance_todo_app/screens/home_screen.dart';
import 'package:advance_todo_app/screens/login_screen.dart';

Map<String,Widget Function(BuildContext)> routingMap = {
  LoginScreen.routeName: (context) => const LoginScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  DrawerScreen.routeName: (context) => const DrawerScreen(),
  AddTaskScreen.routeName: (context) => const AddTaskScreen(),
  HomePage.routeName: (context) => const HomePage(),
};
