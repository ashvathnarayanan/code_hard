import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:version1/screens/logo_screen.dart';
import './screens/Root.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Employed',
      theme: ThemeData(
          primaryColor: Color.fromRGBO(21, 70, 156, 1),
          accentColor: Colors.blueAccent,
          scaffoldBackgroundColor: Colors.white),
      home: LogoScreen(),
    );
  }
}
//t
