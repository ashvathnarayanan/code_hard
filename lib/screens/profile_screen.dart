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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://wallpaperaccess.com/full/672238.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: GestureDetector(
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
                            backgroundColor: Colors.grey,
                            radius: MediaQuery.of(context).size.height / 10,
                            backgroundImage: x.data['picture'] == null
                                ? NetworkImage(
                                    'https://static.thenounproject.com/png/961-200.png')
                                : NetworkImage(x.data['picture']),
                          ),
                        ),
                      );
                    },
                  ),
                  Container(
                    height: size.height * 0.68,
                    width: size.width * 1,
                    child: Card(
                      color: Colors.grey[50],
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    //...
                                  },
                                  child: Container(
                                    height: size.height * 0.075,
                                    width: size.width * 0.75,
                                    margin: EdgeInsets.all(20),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                          color:
                                              Colors.blue[900].withOpacity(0.42)),
                                    ),
                                  ),
                                ),
                                Icon(Icons.person)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Text('profession'),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: RaisedButton(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 20),
                                    onPressed: () {},
                                    child: Text(
                                      'Hire me!',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    elevation: 0,
                                    color: Colors.blue[900],
                                    hoverColor: Colors.blue[700],
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        side: BorderSide(
                                            color: Colors.lightBlue)),
                                  ),
                                ),
                              ],
                            ),
                            Divider(),
                            SingleChildScrollView(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    height: size.height * 0.5,
                                    width: size.width * 1,
                                    child: Card(
                                      color: Colors.blue[900],
                                      child: Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                'https://wallpaperaccess.com/full/672238.jpg'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Text(
                                                  'Profile',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize:
                                                        size.width * 0.055,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: size.height * 0.4,
                                                width: size.width * 1,
                                                child: Card(
                                                  color: Colors.white,
                                                  child: Column(
                                                    children: <Widget>[
                                                      ProfileContents(
                                                          size: size),
                                                      ProfileContents(
                                                          size: size),
                                                      ProfileContents(
                                                          size: size),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                'Top Skills',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: size.width * 0.055,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              height: size.height * 0.4,
                              width: size.width * 1,
                            ),
                          ],
                        ),
                      ),
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

class ProfileContents extends StatelessWidget {
  const ProfileContents({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //...
      },
      child: Container(
        height: size.height * 0.075,
        width: size.width * 0.75,
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.blue[900].withOpacity(0.42)),
        ),
      ),
    );
  }
}
