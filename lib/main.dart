import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//
import 'screens/home_page.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/drawer_screen.dart';
import 'screens/splash_screen.dart';
//
import '../provider/user_prov.dart';

void main() async {
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
          ChangeNotifierProvider<UserInfoProv>(create: (_) => UserInfoProv())
        ],
        builder: (context, child) => MaterialApp(
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
                })

            //     })
            ));
  }
}
