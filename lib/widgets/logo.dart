import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              "ETK",
              style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 10,
            ),
            Image.asset(
              'assets/images/logo.png',
              height: 45,
              width: 45,
            )
          ],
        ),
        const Text('TODO',
            style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold))
      ],
    );
  }
}
