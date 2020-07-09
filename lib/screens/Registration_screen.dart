import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Home_screen.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool spinner = false;
  final _formKey = GlobalKey<FormState>();
  String email, password, username;

  List<double> dimensions;
  @override
  Widget build(BuildContext context) {
    dimensions = [
      MediaQuery.of(context).size.height,
      MediaQuery.of(context).size.width
    ];
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Sign up',
                    style: TextStyle(
                        color: Colors.blueAccent,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w700,
                        fontSize: dimensions[0] * 0.085),
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
                            decoration: InputDecoration(labelText: 'Username'),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Username can\'t be empty';
                              } else if (value.length > 13) {
                                return 'Not more than 12 characters';
                              } else {
                                return null;
                              }
                            },
                            onChanged: (input) {
                              setState(() {
                                username = input;
                              });
                            }),
                        SizedBox(
                          height: dimensions[0] / 64,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(labelText: 'Email'),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Email can\'t be empty';
                            } else if (!RegExp(
                                    r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return 'Invalid email address';
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {
                            setState(() {
                              email = value;
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
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Password can\'t be empty';
                              } else if (value.length < 8) {
                                return 'Password should contain atleast 8 characters';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(labelText: 'Password')),
                        SizedBox(
                          height: dimensions[0] / 22,
                        ),
                        Container(
                          width: dimensions[1] * 0.42,
                          child: RaisedButton(
                            color: Colors.blueAccent,
                            child: Text(
                              'Sign Up',
                            ),
                            onPressed: () async {
                              if (username != null ||
                                  username == '' ||
                                  password != null ||
                                  password == '' ||
                                  email != null ||
                                  email == '') {
                                if (_formKey.currentState.validate()) {
                                  setState(() {
                                    spinner = true;
                                  });
                                  var validation = await Firestore.instance
                                      .collection('users')
                                      .where('username', isEqualTo: username)
                                      .getDocuments();
                                  if (validation.documents.length == 0 ||
                                      validation.documents.isEmpty) {
                                    try {
                                      final newuser = await FirebaseAuth
                                          .instance
                                          .createUserWithEmailAndPassword(
                                              email: email, password: password);
                                      if (newuser != null) {
                                        Firestore.instance
                                            .collection('users')
                                            .add({
                                          'usermail': email,
                                          'username': username,
                                          'picture': null,
                                        });
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        HomePage()),
                                            (Route<dynamic> route) => false);
                                      }
                                    } catch (e) {
                                      print(e.message);
                                      String mes = e.message.contains('network')
                                          ? 'Please check your internet connection'
                                          : 'Email  already in use by another account';
                                      showDialog(
                                          context: context,
                                          builder: (context) =>
                                              AlertDialog(title: Text(mes)));
                                    }
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              title: Text(
                                                  'The username you entered already exists'),
                                            ));
                                  }
                                  setState(() {
                                    spinner = false;
                                  });
                                }
                              }
                            },
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
    );
  }
}
