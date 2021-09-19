import 'package:advance_todo_app/screens/login_screen.dart';
import 'package:advance_todo_app/utils/firebase_initialization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;

  double yOffset = 0;

  double scaleFactor = 1;
  bool isDrawerOpen = false;
  double borderRad = 0;

  @override
  Widget build(BuildContext context) {
    return
        // appBar: AppBar(
        //   actions: [
        //     IconButton(
        //         onPressed: () async {
        //           await Authentication.signOut(context: context);
        //           Navigator.pushReplacementNamed(context, LoginScreen.routeName);
        //         },
        //         icon: const Icon(Icons.logout))
        //   ],
        // ),
        AnimatedContainer(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(borderRad)),
      width: double.infinity,
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      duration: const Duration(milliseconds: 250),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              color: Colors.white,
              child: isDrawerOpen
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          xOffset = 0;
                          yOffset = 0;
                          scaleFactor = 1;
                          isDrawerOpen = false;
                          borderRad = 0;
                        });
                      },
                      icon: const Icon(Icons.arrow_back_ios))
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          xOffset = 350;
                          yOffset = 150;
                          scaleFactor = 0.8;
                          isDrawerOpen = true;
                          borderRad = 55;
                        });
                      },
                      icon: const Icon(Icons.menu),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
