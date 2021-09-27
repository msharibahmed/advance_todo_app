import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

//
import 'screens/home_page.dart';
import 'screens/login_screen.dart';
import 'screens/splash_screen.dart';
//
import '../provider/user_prov.dart';
import '../provider/priority_tag_prov.dart';
import '../provider/add_task_prov.dart';
//
import 'package:advance_todo_app/utils/routing.dart';

void main() async {
  //for transparent status bar
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.indigo,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Colors.transparent));

  //firebase initialization
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<UserInfoProv>(create: (_) => UserInfoProv()),
          ChangeNotifierProvider<AddTaskProv>(create: (_) => AddTaskProv()),
          ChangeNotifierProvider<PriorityTagProv>(
              create: (_) => PriorityTagProv()),
        ],
        builder: (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              textTheme: GoogleFonts.openSansTextTheme(
                Theme.of(context).textTheme,
              ),
              primarySwatch: Colors.indigo,
            ),
            routes: routingMap,
            home: FutureBuilder<User?>(
                future: FirebaseAuth.instance.authStateChanges().first,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SplashScreen();
                  }
                  final user = snapshot.data;
                  if (user == null) {
                    return const LoginScreen();
                  }

                  return const HomePage();
                })));
  }
}
