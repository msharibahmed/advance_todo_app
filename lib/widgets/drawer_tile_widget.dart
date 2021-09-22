import 'package:flutter/material.dart';

class DrawerListTileWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function func;

  const DrawerListTileWidget(
      {Key? key, required this.title, required this.icon, required this.func})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await func();
      },
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.grey,
        ),
        title: Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
