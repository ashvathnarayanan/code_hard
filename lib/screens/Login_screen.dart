import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:move_to_background/move_to_background.dart';
import 'package:version1/screens/Registration_screen.dart';
import 'Home_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool spinner = false;
  String email, password, username;
  List<double> dimensions;

  @override
  Widget build(BuildContext context) {
    dimensions = [
      MediaQuery.of(context).size.height,
      MediaQuery.of(context).size.width
    ];
    return WillPopScope(
      onWillPop: () async {
        MoveToBackground.moveTaskToBack();
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.blue[900],
        body: Container(
          child: ModalProgressHUD(
            inAsyncCall: spinner,
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 50, left: 24, right: 24),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      // extract this widget it is used in multiple places the key feature is size 
                      // in both places so take size as var and store it and give as arguments
                      Container(
                        child: RichText(
                          text: TextSpan(
                            style:
                                Theme.of(context).textTheme.headline6.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                            children: [
                              TextSpan(
                                text: "EM",
                                style: TextStyle(
                                  color: Colors.blue[300],
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.08,
                                ),
                              ),
                              TextSpan(
                                text: "PLOYED",
                                style: TextStyle(
                                  color: Colors.grey[200],
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.08,
                                ),
                              ),
                              TextSpan(
                                text: ".",
                                style: TextStyle(
                                  color: Colors.blue[300],
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.12,
                                ),
                              ),
                              TextSpan(
                                text: "IN",
                                style: TextStyle(
                                  color: Colors.grey[200],
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.08,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: dimensions[0] / 64,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  labelText: 'Username',
                                  labelStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: dimensions[1] * 0.05),
                                  fillColor: Colors.white),
                              validator: (value) => value.isEmpty
                                  ? 'Username can\'t be empty'
                                  : null,
                              onChanged: (value) {
                                setState(() {
                                  username = value;
                                });
                              },
                            ),
                            SizedBox(
                              height: dimensions[0] / 64,
                            ),
                            TextFormField(
                              obscureText: true,
                              onChanged: (input) {
                                setState(() {
                                  password = input;
                                });
                              },
                              validator: (value) => value.isEmpty
                                  ? 'Password can\'t be empty'
                                  : null,
                              decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: dimensions[1] * 0.05)),
                            ),
                            SizedBox(
                              height: dimensions[0] / 32,
                            ),
                            Container(
                              width: dimensions[1] * 0.7,
                              child: RaisedButton(
                                color: Colors.blueAccent,
                                child: Text(
                                  'Log In',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () async {
                                  if (username != null ||
                                      username == '' ||
                                      password != null ||
                                      password == '') {
                                    if (_formKey.currentState.validate()) {
                                      setState(() {
                                        spinner = true;
                                      });
                                      try {
                                        var validation = await Firestore
                                            .instance
                                            .collection('users')
                                            .where('username',
                                                isEqualTo: username)
                                            .getDocuments();
                                        email = validation
                                            .documents[0].data['usermail'];
                                        final newuser = await FirebaseAuth
                                            .instance
                                            .signInWithEmailAndPassword(
                                                email: email,
                                                password: password);
                                        if (newuser != null) {
                                          SharedPreferences pref =
                                              await SharedPreferences
                                                  .getInstance();
                                          pref.setBool('isLogin', true);
                                          pref.setString('user', email);
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          HomePage()));
                                        }
                                      } catch (e) {
                                        SharedPreferences pref =
                                            await SharedPreferences
                                                .getInstance();
                                        pref.setBool('isLogin', false);
                                        pref.setString('user', '');
                                        String mes =
                                            'The username does not exist';
                                        if (e.message
                                            .toString()
                                            .contains('password')) {
                                          mes = 'Incorrect password';
                                        } else if (e.message
                                            .toString()
                                            .contains('network error')) {
                                          mes =
                                              'Please check your internet connection.';
                                        }
                                        showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                  title: Text(
                                                    mes,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ));
                                      }
                                    }
                                  }
                                  setState(() {
                                    spinner = false;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              width: dimensions[1] * 0.55,
                              child: Divider(),
                            ),
                            Container(
                              width: dimensions[1] * 0.7,
                              child: RaisedButton(
                                color: Colors.blueAccent,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              RegistrationScreen()));
                                },
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
