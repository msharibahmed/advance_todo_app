import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
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
