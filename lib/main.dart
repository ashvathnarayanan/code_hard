import 'package:flutter/material.dart';
import 'package:version1/quiz/mainQuizPage.dart';
import 'package:version1/quiz/mainQuizPageCpp.dart';
import 'package:version1/quiz/mainQuizPageJava.dart';
import 'package:version1/quiz/resultPage.dart';
import 'package:version1/screens/Home_screen.dart';
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
      home: HomePage(),
    );
  }
}
//t