import 'package:flutter/material.dart';

class Measures extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.blue[900].withOpacity(0.42)),
          ),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              icon: Icon(Icons.search),
              hintText: "What are you looking for?",
              hintStyle: TextStyle(color: Colors.blue[900]),
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              Container(
                width: size.width * 0.95,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(colors: [
                      Colors.blue[700].withOpacity(0.8),
                      Colors.blue[800].withOpacity(0.7),
                      Colors.blue[900],
                    ])),
                margin: EdgeInsets.only(left: 10),
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Get ahead. Get an internship!",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: size.width * 0.055,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Apply to over 10,000 internships",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width * 0.042,
                          ),
                        ),
                        Text(
                          "for free",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width * 0.042,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 45),
                              child: Text(
                                "Find Interships",
                                style: TextStyle(
                                    color: Colors.blue[100],
                                    fontSize: size.width * 0.042,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.only(top: 48, left: 10),
                                child: Icon(
                                  Icons.loop,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: size.width * 0.2),
              Container(
                width: size.width * 0.95,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(colors: [
                      Colors.lightBlue[600].withOpacity(0.8),
                      Colors.lightBlue[700].withOpacity(0.7),
                      Colors.lightBlueAccent[100],
                    ])),
                margin: EdgeInsets.only(left: 10),
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Internship Program",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width * 0.055,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "1000 virtual internships available",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width * 0.045,
                          ),
                        ),
                        Text(
                          "apply soon",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width * 0.045,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 45),
                              child: Text(
                                "View now",
                                style: TextStyle(
                                    color: Colors.lightBlue[100],
                                    fontSize: size.width * 0.045,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.only(top: 48, left: 10),
                                child: Icon(
                                  Icons.loop,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: size.width * 0.015)
            ],
          ),
        ),
        Divider(thickness: 1.5,color: Colors.blue[300],),
        Center(
          child: Text('Internships',
              style: TextStyle(
                color: Colors.blue[800],
                  fontSize: size.height * 0.035, fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 5,
        ),
        Center(
          child: Text('Apply to 10,000+ internships for free',
              style: TextStyle(
                  fontSize: size.height * 0.025, color: Colors.black38)),
        )
      ],
    );
  }
}
