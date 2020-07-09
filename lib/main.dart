import 'package:flutter/material.dart';
import './screens/Root.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Version1',
      theme: ThemeData(
          primaryColor: Color.fromRGBO(21, 70, 156, 1),
          accentColor: Colors.blueAccent,
          scaffoldBackgroundColor: Colors.white),
      home: RootScreen(),
    );
  }
}
//t