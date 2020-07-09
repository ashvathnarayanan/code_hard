import 'package:flutter/material.dart';

import '../pages/page_1.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
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
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.message),
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.blue,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
