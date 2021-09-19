import 'package:advance_todo_app/utils/constants.dart';
import 'package:advance_todo_app/widgets/drawer_tile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DrawerScreen extends StatefulWidget {
  static const routeName = '/drawer-screen';
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkbackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 200,
            ),
            CircleAvatar(
              child: Image.asset(
                'assets/images/logo.png',
              ),
              maxRadius: 50,
              minRadius: 50,
            ),
            const SizedBox(height: 40),
            const Text(
              'Sharib\nAhmed',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w300),
            ),
            const SizedBox(height: 60),
            const DrawerListTileWidget(
                title: 'Today', icon: Icons.turned_in_not),
            const SizedBox(height: 5),
            const DrawerListTileWidget(
                title: 'Upcoming', icon: Icons.task_outlined),
            const SizedBox(height: 5),
            const DrawerListTileWidget(
                title: 'Completed', icon: Icons.assignment),
            const SizedBox(height: 5),
            const DrawerListTileWidget(title: 'Settings', icon: Icons.settings),
            const SizedBox(height: 5),
            const Spacer(),
            const DrawerListTileWidget(
                title: 'Log Out', icon: Icons.logout_rounded),
          ],
        ),
      ),
    );
  }
}
