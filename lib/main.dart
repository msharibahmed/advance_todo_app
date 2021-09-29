import 'package:advance_todo_app/utils/firebase_initialization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';

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
            home: Authentication.firstScreen()));
  }
}
