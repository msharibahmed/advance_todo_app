import 'package:advance_todo_app/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//
import 'drawer_screen.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home-page';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
        body: Stack(
      children: const [DrawerScreen(), HomeScreen()],
    ));
  }
}
