import 'package:flutter/material.dart';
import 'package:version1/screens/Root.dart';

import '../screens/Root.dart';

class LogoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
              context,
              MaterialPageRoute(builder: (ctx) => RootScreen()),
            );
      },
      child: Scaffold(
        body: Center(
          child: Image.asset(
            "lib/assets/images/giflogo.gif",
          ),
        ),
      ),
    );
  }
}
