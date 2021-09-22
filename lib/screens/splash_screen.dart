import 'package:advance_todo_app/screens/home_page.dart';
import 'package:advance_todo_app/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // FirebaseAuth.instance.authStateChanges().listen((user) {
    //   if (user == null) {
    //     Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    //   } else {
    //     Navigator.pushReplacementNamed(context, HomePage.routeName);
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.asset('assets/images/splash_screen.jpg'),
            ),
          ),
          const CircularProgressIndicator(
            color: Colors.black,
            strokeWidth: 2,
          ),
          const SizedBox(
            height: 80,
          )
        ],
      ),
    );
  }
}
