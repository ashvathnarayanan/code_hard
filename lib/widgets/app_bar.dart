import 'package:flutter/material.dart';

AppBar homeAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: CircleAvatar(
          child: Text('pic'),
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
                  text: "LINKED",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                TextSpan(
                  text: "SHALA",
                  style: TextStyle(
                    color: Colors.grey[400],
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
            icon: Icon(Icons.send),
            onPressed: () {},
            color: Colors.blue,
          ),
        ],
      )
    ],
  );
}
