import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';
import '../widgets/top.dart';


class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Center(
          child: Container(
            child: RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.headline6.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                children: [
                  TextSpan(
                    text: "EM",
                    style: TextStyle(
                      color: Colors.blue[300],
                    ),
                  ),
                  TextSpan(
                    text: "PLOYED",
                    style: TextStyle(
                      color: Colors.grey[200],
                    ),
                  ),
                  TextSpan(
                    text: ".",
                    style: TextStyle(
                      color: Colors.blue[300],
                    ),
                  ),
                  TextSpan(
                    text: "in",
                    style: TextStyle(
                      color: Colors.grey[200],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Measures(),
        ],
      ),
    );
  }
}
