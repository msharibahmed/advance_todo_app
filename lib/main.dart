import 'package:flutter/material.dart';
//
import 'screens/home_page.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/drawer_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        LoginScreen.routeName: (context) => const LoginScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        DrawerScreen.routeName: (context) => const DrawerScreen(),
        HomePage.routeName: (context) => const HomePage(),
      },
      home: const LoginScreen(),
    );
  }
}
