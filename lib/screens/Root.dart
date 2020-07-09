import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:version1/screens/Login_screen.dart';

import 'Home_screen.dart';

class RootScreen extends StatefulWidget {
  static const id = 'root';
  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  void initState() {
    super.initState();
    check();
  }

  void check() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      if (pref.getBool('isLogin') == false || pref.getBool('isLogin') == null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => HomePage()));
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
