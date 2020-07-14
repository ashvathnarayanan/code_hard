import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:version1/quiz/JavaQuestionBank.dart';
import 'package:version1/quiz/resultPage.dart';
import '../widgets/app_bar.dart';

int index = 0;
int score = 0;
Color inactive = Color(0xffE2E7F2);
Color active = Colors.greenAccent;
Color current1 = Color(0xffE2E7F2);
Color current2 = Color(0xffE2E7F2);
Color current3 = Color(0xffE2E7F2);
Color current4 = Color(0xffE2E7F2);
String selected = "";

class MainQuizPageJava extends StatefulWidget {
  @override
  _MainQuizPageJavaState createState() => _MainQuizPageJavaState();
}

class _MainQuizPageJavaState extends State<MainQuizPageJava> {
  @override
  Widget build(BuildContext context) {
    List<JavaQuestion> javaList = [];
    javaList.add(JavaQuestion(
        question: 'Which of those doesnt have an index based structure?',
        option1: 'List',
        option2: 'set',
        option3: 'map',
        option4: 'All the above',
        answer: 'set'));
    javaList.add(JavaQuestion(
        question: 'java.util.Collections is a:',
        option1: 'Class',
        option2: 'Interface',
        option3: 'Object',
        option4: 'None of the above',
        answer: 'Class'));
    javaList.add(JavaQuestion(
        question: 'Methods such as reverse, shuffle are offered in:',
        option1: "Object",
        option2: 'Collection',
        option3: 'Collections',
        option4: 'Apache Commons Collections',
        answer: 'Collections'));
    javaList.add(JavaQuestion(
        question: 'Which of those allows duplicate elements?',
        option1: 'Set',
        option2: 'List',
        option3: 'All',
        option4: 'None of these',
        answer: 'List'));
    javaList.add(JavaQuestion(
        question: 'Which allows the storage of a null key and null values?',
        option1: 'Hashtable',
        option2: 'HashMap',
        option3: 'None of the above',
        option4: 'Both of the above',
        answer: 'HashMap'));
    javaList.add(JavaQuestion(
        question:
            'Which interface should be implemented for sorting on basis of many criteria’s?',
        option1: 'Comparator',
        option2: 'Comparable',
        option3: 'Serializable',
        option4: 'None of the above',
        answer: 'Comparator'));
    javaList.add(JavaQuestion(
        question:
            'In ConcurrentHashMap - once thread locks one segment for updation it doesnt block it for retrieval hence another thread will scan the same segment, however, it will be ready to read the data before locking?',
        option1: 'True',
        option2: 'False',
        option3: 'Cant say',
        option4: 'Wrong Question',
        answer: 'True'));
    javaList.add(JavaQuestion(
        question:
            'Which Set class should be most popular in a multi-threading environment, considering performance constraint?',
        option1: 'HashSet',
        option2: 'ConcurrentSkipList Set',
        option3: 'LinkedHashSet',
        option4: 'CopyOnWriteArraySet',
        answer: 'ConcurrentSkipList Set'));
    javaList.add(JavaQuestion(
        question: 'Which allows the removal of elements from a collection?',
        option1: 'Enumeration',
        option2: 'Iterator',
        option3: 'Both',
        option4: 'None of the above',
        answer: 'None of the above'));
    javaList.add(JavaQuestion(
        question: 'Which of the following is not a Java features?',
        option1: 'Dynamic',
        option2: 'Architecture Neutral',
        option3: 'Use of pointers',
        option4: 'Object-oriented',
        answer: 'Use of pointers'));

    return Scaffold(
      appBar: homeAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Java',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 40,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'Question no. ${index + 1} of ${javaList.length}',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),

            SizedBox(
              height: 50,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: Text(
                      '${javaList[index].question}',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 40,
            ),

            //OPTION1
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Row(children: <Widget>[
                Flexible(
                  child: GestureDetector(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: MediaQuery.of(context).size.width * 0.85,
                        minHeight: 50,
                      ),
                      child: Container(
                        color: current1,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15, top: 15, bottom: 15),
                          child: Row(
                            children: <Widget>[
                              Flexible(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      'A.) ${javaList[index].option1}',
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueAccent,
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
                    onTap: () {
                      if (current1 == inactive) {
                        setState(() {
                          current1 = active;
                          current2 = inactive;
                          current3 = inactive;
                          current4 = inactive;
                          selected = "";
                          selected = javaList[index].option1;
                        });
                      } else if (current1 == active) {
                        setState(() {
                          current1 = inactive;
                          current2 = inactive;
                          current3 = inactive;
                          current4 = inactive;

                          selected = "";
                        });
                      }
                    },
                  ),
                ),
              ]),
            ),

            SizedBox(
              height: 20,
            ),

            //OPTION2
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Row(children: <Widget>[
                Flexible(
                  child: GestureDetector(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: MediaQuery.of(context).size.width * 0.85,
                        minHeight: 50,
                      ),
                      child: Container(
                        color: current2,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15, top: 15, bottom: 15),
                          child: Row(
                            children: <Widget>[
                              Flexible(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      'B.) ${javaList[index].option2}',
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueAccent,
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
                    onTap: () {
                      if (current2 == inactive) {
                        setState(() {
                          current2 = active;
                          current1 = inactive;
                          current3 = inactive;
                          current4 = inactive;
                          selected = "";
                          selected = javaList[index].option2;
                        });
                      } else if (current2 == active) {
                        setState(() {
                          current1 = inactive;
                          current2 = inactive;
                          current3 = inactive;
                          current4 = inactive;
                          selected = "";
                        });
                      }
                    },
                  ),
                ),
              ]),
            ),

            SizedBox(
              height: 20,
            ),

            //OPTION3
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Row(children: <Widget>[
                Flexible(
                  child: GestureDetector(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: MediaQuery.of(context).size.width * 0.85,
                        minHeight: 50,
                      ),
                      child: Container(
                        color: current3,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15, top: 15, bottom: 15),
                          child: Row(
                            children: <Widget>[
                              Flexible(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      'C.) ${javaList[index].option3}',
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueAccent,
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
                    onTap: () {
                      if (current3 == inactive) {
                        setState(() {
                          current3 = active;
                          current1 = inactive;
                          current2 = inactive;
                          current4 = inactive;
                          selected = "";
                          selected = javaList[index].option3;
                        });
                      } else if (current3 == active) {
                        setState(() {
                          current1 = inactive;
                          current2 = inactive;
                          current3 = inactive;
                          current4 = inactive;
                          selected = "";
                        });
                      }
                    },
                  ),
                ),
              ]),
            ),

            SizedBox(
              height: 20,
            ),

            //OPTION4
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Row(children: <Widget>[
                Flexible(
                  child: GestureDetector(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: MediaQuery.of(context).size.width * 0.85,
                        minHeight: 50,
                      ),
                      child: Container(
                        color: current4,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15, top: 15, bottom: 15),
                          child: Row(
                            children: <Widget>[
                              Flexible(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      'D.) ${javaList[index].option4}',
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueAccent,
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
                    onTap: () {
                      if (current4 == inactive) {
                        setState(() {
                          current4 = active;
                          current1 = inactive;
                          current2 = inactive;
                          current3 = inactive;
                          selected = "";
                          selected = javaList[index].option4;
                        });
                      } else if (current4 == active) {
                        setState(() {
                          current1 = inactive;
                          current2 = inactive;
                          current3 = inactive;
                          current4 = inactive;
                          selected = "";
                        });
                      }
                    },
                  ),
                ),
              ]),
            ),

            SizedBox(
              height: 40,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                (index < javaList.length - 1)
                    ? Container(
                        width: 120,
                        height: 40,
                        child: FlatButton(
                          color: Colors.greenAccent,
                          child: Text(
                            'Next',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          onPressed: () {
                            if (selected == javaList[index].answer) {
                              setState(() {
                                score = score + 1;
                              });
                            } else {}

                            if (index < javaList.length - 1) {
                              setState(() {
                                index = index + 1;
                                current1 = inactive;
                                current2 = inactive;
                                current3 = inactive;
                                current4 = inactive;
                                selected = "";
                              });
                            }
                          },
                        ),
                      )
                    : Container(
                        width: 120,
                        height: 40,
                        child: FlatButton(
                          color: Colors.blueAccent,
                          child: Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () async {
                            if (selected == javaList[index].answer) {
                              setState(() {
                                score = score + 1;
                              });
                            } else {}
                            var liu = await FirebaseAuth.instance.currentUser();
                            var x = await Firestore.instance
                                .collection('users')
                                .where('usermail', isEqualTo: liu.email)
                                .getDocuments();
                            await Firestore.instance
                                .collection('users')
                                .document(x.documents[0].documentID)
                                .updateData({
                              'video': x.documents[0].data['video'],
                              'usermail': x.documents[0].data['usermail'],
                              'username': x.documents[0].data['username'],
                              'picture': x.documents[0].data['picture'],
                              'python': x.documents[0].data['python'],
                              'c++': x.documents[0].data['c++'],
                              'java': '$score/10'
                            });

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResultPage(
                                        score: score,
                                        totalQuestions: javaList.length,
                                      )),
                            );
                          },
                        ),
                      ),
              ],
            ),

            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
