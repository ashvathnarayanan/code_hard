import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  FirebaseStorage storage =
      FirebaseStorage(storageBucket: 'gs://codehard-91b10.appspot.com');
  Firestore cloud = Firestore.instance;
  String url;
  var user, x;

  @override
  void initState() {
    super.initState();
    setState(() {
      getuser();
    });
  }

  void getuser() async {
    user = await FirebaseAuth.instance.currentUser();
  }

  Future<String> upload(File file) async {
    try {
      var storageref = storage.ref().child('userpics/${user.uid}');
      var uploadtask = storageref.putFile(file);
      var completedtask = await uploadtask.onComplete;
      String downloadurl = await completedtask.ref.getDownloadURL();
      return downloadurl;
    } catch (e) {
      print(e);
    }
    return null;
  }

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
              // this widget comes in many places..make it into one main widget and get size as argument
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
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              StreamBuilder<QuerySnapshot>(
                stream: cloud.collection('users').snapshots(),
                builder: (context, snapshots) {
                  if (!snapshots.hasData) {
                    return CircularProgressIndicator();
                  }
                  var id = snapshots.data.documents;
                  for (var i in id) {
                    if (i.data['usermail'] == user.email) {
                      x = i;
                    }
                  }
                  return GestureDetector(
                    onTap: () async {
                      File image = await ImagePicker.pickImage(
                          source: ImageSource.gallery);
                      try {
                        url = await upload(image);
                        await cloud
                            .collection('users')
                            .document(x.documentID)
                            .updateData({
                          'usermail': x.data['usermail'],
                          'username': x.data['username'],
                          'picture': url == null ? x.data['picture'] : url
                        });
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.height / 10,
                      backgroundImage: x.data['picture'] == null
                          ? NetworkImage(
                              'https://static.thenounproject.com/png/961-200.png')
                          : NetworkImage(x.data['picture']),
                    ),
                  );
                },
              ),
            ],
          ),
        )));
  }
}
