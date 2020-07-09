import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  // final String id;
  // final String text;

  // Page3(this.id,this.text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () {}),
        title: Text('Share Post'),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              FlatButton(
                child: Text(
                  'Post',
                  style: TextStyle(color: Colors.blue[100], fontSize: 18),
                ),
                onPressed: () {},
                color: Colors.blue,
              ),
            ],
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 15, right: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'What do you want to talk about?',
                  border: InputBorder.none,
                ),
                maxLines: 8,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.next,
                style: TextStyle(fontSize: 22),
              ),
            ),
          ),
          ShareOptions()
        ],
      ),
    );
  }
}

class ShareOptions extends StatelessWidget {

  const ShareOptions({
    Key key,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(icon: Icon(Icons.photo_library), onPressed: () {}),
      title: Text('Add a photo'),
    );
  }
}
