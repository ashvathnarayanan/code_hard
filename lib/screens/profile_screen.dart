import 'dart:io';
import 'package:version1/quiz/mainQuizPage.dart';
import 'package:version1/quiz/mainQuizPageCpp.dart';
import 'package:version1/quiz/mainQuizPageJava.dart';
import 'package:version1/quiz/resultPage.dart';
import 'package:version1/screens/Home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

VideoPlayerController _controller;
Future<void> _initializeVideoPlayerFuture;

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
    } catch (e) {}
    return null;
  }

  Future<String> uploadvideo(File file) async {
    try {
      var storageref = storage.ref().child('userpics/${user.uid}video');
      var uploadtask = storageref.putFile(file);
      var completedtask = await uploadtask.onComplete;
      String downloadurl = await completedtask.ref.getDownloadURL();
      return downloadurl;
    } catch (e) {}
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
                      return Column(
                        children: <Widget>[
                          Text(
                            x.data['username'],
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
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
                                    'picture':
                                        url == null ? x.data['picture'] : url
                                  });
                                } catch (e) {}
                              },
                              child: Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    radius:
                                        MediaQuery.of(context).size.height / 12.5,
                                    backgroundImage: x.data['picture'] == null
                                        ? NetworkImage(
                                            'https://static.thenounproject.com/png/961-200.png')
                                        : NetworkImage(x.data['picture']),
                                  ),
                                  x.data['video'] == null
                                      ? (x.data['usermail'] == user.email
                                          ? IconButton(
                                              color: Colors.white,
                                              icon: Icon(Icons.video_call),
                                              onPressed: () async {
                                                File video =
                                                    await ImagePicker.pickVideo(
                                                        source: ImageSource
                                                            .gallery);
                                                try {
                                                  url =
                                                      await uploadvideo(video);
                                                  await cloud
                                                      .collection('users')
                                                      .document(x.documentID)
                                                      .updateData({
                                                    'usermail':
                                                        x.data['usermail'],
                                                    'username':
                                                        x.data['username'],
                                                    'picture':
                                                        x.data['picture'],
                                                    'video': url == null
                                                        ? x.data['video']
                                                        : url,
                                                  });
                                                } catch (e) {}
                                              },
                                            )
                                          : Container())
                                      : IconButton(
                                          color: Colors.white,
                                          icon: Icon(Icons.play_arrow),
                                          onPressed: () {
                                            _controller =
                                                VideoPlayerController.network(
                                              x.data['video'],
                                            );
                                            _initializeVideoPlayerFuture =
                                                _controller.initialize();
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        Video()));
                                          },
                                        ),
                                  Flexible(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text('Python : ${x.data['python']}',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        Text('C++ : ${x.data['c++']}',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        Text('Java : ${x.data['java']}',
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        MainQuizPage()));
                          },
                          child: Text('Python quiz')),
                      RaisedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        MainQuizPageJava()));
                          },
                          child: Text('Java quiz')),
                      RaisedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        MainQuizPageCpp()));
                          },
                          child: Text('C++ quiz')),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
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
                                            color: Colors.blue[900]
                                                .withOpacity(0.42)),
                                      ),
                                    ),
                                  ),
                                  Icon(Icons.person)
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: size.height * 0.5,
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

class Video extends StatefulWidget {
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
