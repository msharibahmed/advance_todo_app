import 'package:flutter/material.dart';

class DrawerListTileWidget extends StatelessWidget {
  final String title;
  final IconData icon;

  const DrawerListTileWidget(
      {Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.grey,
      ),
      title: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300),
      ),
    );
  }
}
