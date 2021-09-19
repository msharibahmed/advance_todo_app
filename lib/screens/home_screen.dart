import 'package:advance_todo_app/screens/login_screen.dart';
import 'package:advance_todo_app/utils/firebase_initialization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await Authentication.signOut(context: context);
                Navigator.pushReplacementNamed(context, LoginScreen.routeName);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(child: Text(args.email ?? 'null')),
    );
  }
}
