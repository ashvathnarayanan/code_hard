import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';
import '../widgets/top.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      body: Column(
        children: <Widget>[
          SizedBox(height: 10,),
          Measures(),
        ],
      ),
    );
  }
}