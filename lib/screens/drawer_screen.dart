import 'package:advance_todo_app/provider/user_prov.dart';
import 'package:advance_todo_app/utils/firebase_initialization.dart';
import 'package:advance_todo_app/widgets/drawer_tile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class DrawerScreen extends StatelessWidget {
  static const routeName = '/drawer-screen';
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _userInfo = Provider.of<UserInfoProv>(context).loggedInUserInfo;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.withOpacity(0.8),
              Colors.white.withOpacity(0.4)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 200,
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(
                    _userInfo!.photoURL ?? 'assets/images/logo.png'),
                maxRadius: 50,
                minRadius: 50,
              ),
              const SizedBox(height: 40),
              Text(
                _userInfo.displayName ?? "New User",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 60),
              DrawerListTileWidget(
                title: 'Today',
                icon: Icons.turned_in_not,
                func: () {},
              ),
              const SizedBox(height: 5),
              DrawerListTileWidget(
                  title: 'Upcoming', icon: Icons.task_outlined, func: () {}),
              const SizedBox(height: 5),
              DrawerListTileWidget(
                  title: 'Completed', icon: Icons.assignment, func: () {}),
              const SizedBox(height: 5),
              DrawerListTileWidget(
                title: 'Settings',
                icon: Icons.settings,
                func: () {},
              ),
              const SizedBox(height: 5),
              const Spacer(),
              DrawerListTileWidget(
                title: 'Log Out',
                icon: Icons.logout_rounded,
                func: () async {
                  await Authentication.signOut(context: context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
