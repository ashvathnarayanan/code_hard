import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:version1/quiz/pythonQuestionBank.dart';
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

class MainQuizPage extends StatefulWidget {
  @override
  _MainQuizPageState createState() => _MainQuizPageState();
}

class _MainQuizPageState extends State<MainQuizPage> {
  @override
  Widget build(BuildContext context) {
    List<PythonQuestion> pythonList = [];
    pythonList.add(PythonQuestion(
        question:
            'In the following options which are python libraries which are used for data analysis and scientific computations',
        option1: 'Numpy',
        option2: 'Scipy',
        option3: 'Pandas',
        option4: 'All the above',
        answer: 'All the above'));
    pythonList.add(PythonQuestion(
        question: 'Which method is used to convert raw byte data to a string?',
        option1: 'Encode()',
        option2: 'Decode()',
        option3: 'Convert()',
        option4: 'tostring()',
        answer: 'Decode()'));
    pythonList.add(PythonQuestion(
        question:
            'What will be the output of the following code:- \n print(type(1/2))',
        option1: "<class 'float'>",
        option2: '<class int>',
        option3: 'NameError: ½ is not defined',
        option4: '0.5',
        answer: '<class float>'));
    pythonList.add(PythonQuestion(
        question:
            'What is the output of the following program :print "Hello World"[::-1]',
        option1: 'dlroWolleH',
        option2: 'HelloWorl',
        option3: 'd',
        option4: 'Error',
        answer: 'dlroWolleH'));
    pythonList.add(PythonQuestion(
        question:
            'Given a function that does not return any value, what value is shown when executed at the shell?',
        option1: 'int',
        option2: 'bool',
        option3: 'void',
        option4: 'none',
        answer: 'none'));
    pythonList.add(PythonQuestion(
        question: 'Which of the following is not a complex number?',
        option1: 'k=2+3j',
        option2: 'k=complex(2,3)',
        option3: 'k=2+3I',
        option4: 'k=2+3J',
        answer: 'k=2+3I'));
    pythonList.add(PythonQuestion(
        question: '.________ is a simple but incomplete version of a function.',
        option1: 'stub',
        option2: 'Function',
        option3: 'A function developed using bottom-up approach',
        option4: 'A function developed using top-down approach.',
        answer: 'stub'));
    pythonList.add(PythonQuestion(
        question: 'Which of the following is correct about Python?',
        option1: 'It supports automatic garbage collection.',
        option2:
            'It can be easily integrated in C,C++,COM,ActiveX,COBRA and Java',
        option3: 'Both of the above',
        option4: 'None of the above',
        answer: 'Both of the above'));
    pythonList.add(PythonQuestion(
        question:
            'To start Python from the command prompt, use the command ______',
        option1: 'execute python',
        option2: 'go python',
        option3: 'python',
        option4: 'run python',
        answer: 'python'));
    pythonList.add(PythonQuestion(
        question: 'Which of these is not a core data type?',
        option1: 'Lists',
        option2: 'Dictionary',
        option3: 'Tuples',
        option4: 'Class',
        answer: 'Class'));

    PythonQuestion pq = pythonList[index];

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
                  'Python',
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
              child: Flexible(
                 child: Text(
                  'Question no. ${index + 1} of ${pythonList.length}',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
                      '${pythonList[index].question}',
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
                                      'A.) ${pythonList[index].option1}',
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
                          selected = pythonList[index].option1;
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
                                      'B.) ${pythonList[index].option2}',
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
                          selected = pythonList[index].option2;
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
                                      'C.) ${pythonList[index].option3}',
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
                          selected = pythonList[index].option3;
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
                                      'D.) ${pythonList[index].option4}',
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
                          selected = pythonList[index].option4;
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
                (index < pythonList.length - 1)
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
                          onPressed: () async {
                            if (selected == pythonList[index].answer) {
                              setState(() {
                                score = score + 1;
                              });
                            } else {}

                            if (index < pythonList.length - 1) {
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
                            if (selected == pythonList[index].answer) {
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
                              'python': '$score/10',
                              'c++': x.documents[0].data['c++'],
                              'java': x.documents[0].data['java']
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResultPage(
                                        score: score,
                                        totalQuestions: pythonList.length,
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
