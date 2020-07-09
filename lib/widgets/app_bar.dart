import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:version1/screens/Login_screen.dart';
import '../screens/profile_screen.dart';

AppBar homeAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.blue[900],
    elevation: 0,
    leading: Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (ctx) => ProfileScreen()),
            );
          },
          child: CircleAvatar(
            child: Text('pic'),
            backgroundColor: Colors.blue,
          ),
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
    ],
  );
}
