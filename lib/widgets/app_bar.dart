import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:version1/screens/Login_screen.dart';

AppBar homeAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.black87,
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
      IconButton(
        onPressed: () async {
          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setBool('isLogin', false);
          pref.setString('user', '');
          FirebaseAuth.instance.signOut();
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
              (Route<dynamic> route) => false);
        },
        color: Colors.blueAccent,
        icon: Icon(Icons.exit_to_app),
      ),
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
