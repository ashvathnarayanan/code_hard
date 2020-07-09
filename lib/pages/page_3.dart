import 'package:flutter/material.dart';
import 'package:version1/pages/page_1.dart';
import '../screens/Home_screen.dart';

class Page3 extends StatelessWidget {
  // final String id;
  // final String text;

  // Page3(this.id,this.text);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        
        title: Text(
          'Share Post',
          style: TextStyle(fontSize: size.width * 0.055),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              FlatButton(
                child: Text(
                  'Post',
                  style: TextStyle(
                      color: Colors.blue[200], fontSize: size.width * 0.04),
                ),
                onPressed: () {},
                color: Colors.blue[900],
              ),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: size.width * 0.9,
              child: Padding(
                padding: const EdgeInsets.only(top: 40, left: 15, right: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'What do you want to talk about?',
                    border: InputBorder.none,
                  ),
                  maxLines: 10,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.next,
                  style: TextStyle(fontSize: size.width * 0.055),
                ),
              ),
            ),
            ShareOptions(title: 'Add a photo', icotxt: Icons.photo_library),
            ShareOptions(title: 'Take a video', icotxt: Icons.camera),
            ShareOptions(title: 'Add a document', icotxt: Icons.library_books),
            ShareOptions(title: 'Find an expert', icotxt: Icons.info),
            ShareOptions(title: 'Create a poll', icotxt: Icons.equalizer),
          ],
        ),
      ),
    );
  }
}

class ShareOptions extends StatelessWidget {
  final String title;
  final icotxt;

  const ShareOptions({
    Key key,
    this.title,
    this.icotxt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListTile(
      leading: IconButton(
        icon: Icon(icotxt),
        onPressed: () {},
        iconSize: size.width * 0.07,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: size.width * 0.05, color: Colors.grey[700]),
      ),
    );
  }
}
