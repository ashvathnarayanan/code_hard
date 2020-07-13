
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:version1/quiz/resultPage.dart';
import '../widgets/app_bar.dart';
import 'cppQuestionBank.dart';

int index = 0;
int score = 0;
Color inactive = Color(0xffE2E7F2);
Color active = Colors.greenAccent;
Color current1 = Color(0xffE2E7F2);
Color current2 = Color(0xffE2E7F2);
Color current3 = Color(0xffE2E7F2);
Color current4 = Color(0xffE2E7F2);
String selected="";


class MainQuizPageCpp extends StatefulWidget {
  @override
  _MainQuizPageCppState createState() => _MainQuizPageCppState();
}

class _MainQuizPageCppState extends State<MainQuizPageCpp> {
  @override
  Widget build(BuildContext context) {

    List<CppQuestion> cppList = [];
    cppList.add(CppQuestion(question: 'What is the correct value to return to the operating system upon the successful completion of a program?',option1: '-1',option2: '1',option3: '0',option4: 'Programs do not return a value.',answer: '0'));
    cppList.add(CppQuestion(question: 'What is the only function all C++ programs must contain?',option1: 'start()',option2: 'system()',option3: 'main()',option4: 'program()',answer: 'main()'));
    cppList.add(CppQuestion(question: 'What punctuation is used to signal the beginning and end of code blocks?',option1: "{ }",option2: '->',option3: 'BEGIN and END',option4: '( and )',answer: '{ }'));
    cppList.add(CppQuestion(question: 'Which of the following is a correct comment?', option1: '*/ Comments */',option2: '** Comment **',option3: '/* Comment */',option4: '{ Comment }',answer: '/* Comment */'));
    cppList.add(CppQuestion(question: 'Which of the following is not a correct variable type?', option1: 'float',option2: 'real',option3: 'int',option4: 'double',answer: 'real'));
    cppList.add(CppQuestion(question: 'Which of the following is the correct operator to compare two variables?', option1: ':=',option2: '=',option3: 'equal',option4: '==',answer: '=='));
    cppList.add(CppQuestion(question: 'A protected member of the class in accessible in', option1: 'Only same class',option2: 'Same class and derived class',option3: 'Outside the class',option4: 'None of the above.',answer: 'Same class and derived class'));
    cppList.add(CppQuestion(question: 'Object oriented programming employs_________ programming approach.', option1: 'top-down ',option2: 'procedural',option3: 'bottom-up',option4: 'All of the above',answer: 'bottom-up'));
    cppList.add(CppQuestion(question: 'While redefining a virtual function in the derived class, if its prototype is changed then ', option1: 'It will be overloaded by the compiler',option2: 'Its virtual nature will be lost',option3: 'both a and b',option4: 'Compiler will generate “Prototype mismatch error”',answer: 'both a and b'));
    cppList.add(CppQuestion(question: 'C structure differs from CPP class in regards that by default all the members of the structure are __________ in nature.', option1: ' private',option2: 'protected',option3: 'public',option4: 'None of these',answer: 'public'));










    return Scaffold(
      appBar: homeAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'C++',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            SizedBox(height: 40,),

            Padding(
              padding: const EdgeInsets.only(left:16.0,right:16.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'Question no. ${index+1} of ${cppList.length}',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,

                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 50,),


            Padding(
              padding: const EdgeInsets.only(left:16.0,right:16.0),
              child: Row(

                children: <Widget>[
                  Flexible(
                    child: Text(
                      '${cppList[index].question}',
                      style: TextStyle(
                        fontSize: 30,

                      ),
                    ),
                  ),
                ],
              ),
            ),


            SizedBox(height: 40,),

            //OPTION1
            Padding(
              padding: const EdgeInsets.only(left:16.0,right:16.0),
              child: Row(
                  children: <Widget>[
                    Flexible(
                      child: GestureDetector(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: MediaQuery.of(context).size.width*0.85,
                            minHeight: 50,
                          ),
                          child: Container(
                            color: current1,
                            child: Padding(
                              padding: const EdgeInsets.only(left:15.0,right: 15,top: 15,bottom: 15),
                              child: Row(
                                children: <Widget>[
                                  Flexible(
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          'A.) ${cppList[index].option1}',
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
                        onTap: (){
                          if(current1 == inactive){
                            setState(() {
                              current1 = active;
                              current2 = inactive;
                              current3 = inactive;
                              current4 = inactive;
                              selected = "";
                              selected = cppList[index].option1;

                            });
                          }
                          else if(current1 == active){
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
                  ]
              ),
            ),

            SizedBox(height: 20,),

            //OPTION2
            Padding(
              padding: const EdgeInsets.only(left:16.0,right:16.0),
              child: Row(
                  children: <Widget>[
                    Flexible(
                      child: GestureDetector(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: MediaQuery.of(context).size.width*0.85,
                            minHeight: 50,
                          ),
                          child: Container(
                            color: current2,
                            child: Padding(
                              padding: const EdgeInsets.only(left:15.0,right: 15,top: 15,bottom: 15),
                              child: Row(
                                children: <Widget>[
                                  Flexible(
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          'B.) ${cppList[index].option2}',
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
                        onTap: (){
                          if(current2 == inactive){
                            setState(() {
                              current2 = active;
                              current1 = inactive;
                              current3 = inactive;
                              current4 = inactive;
                              selected = "";
                              selected = cppList[index].option2;

                            });
                          }
                          else if(current2 == active){
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
                  ]
              ),
            ),


            SizedBox(height: 20,),

            //OPTION3
            Padding(
              padding: const EdgeInsets.only(left:16.0,right:16.0),
              child: Row(
                  children: <Widget>[
                    Flexible(
                      child: GestureDetector(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: MediaQuery.of(context).size.width*0.85,
                            minHeight: 50,
                          ),
                          child: Container(
                            color: current3,
                            child: Padding(
                              padding: const EdgeInsets.only(left:15.0,right: 15,top: 15,bottom: 15),
                              child: Row(
                                children: <Widget>[
                                  Flexible(
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          'C.) ${cppList[index].option3}',
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
                        onTap: (){
                          if(current3 == inactive){
                            setState(() {
                              current3 = active;
                              current1 = inactive;
                              current2 = inactive;
                              current4 = inactive;
                              selected = "";
                              selected = cppList[index].option3;

                            });
                          }
                          else if(current3 == active){
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
                  ]
              ),
            ),


            SizedBox(height: 20,),

            //OPTION4
            Padding(
              padding: const EdgeInsets.only(left:16.0,right:16.0),
              child: Row(
                  children: <Widget>[
                    Flexible(
                      child: GestureDetector(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: MediaQuery.of(context).size.width*0.85,
                            minHeight: 50,
                          ),
                          child: Container(
                            color: current4,
                            child: Padding(
                              padding: const EdgeInsets.only(left:15.0,right: 15,top: 15,bottom: 15),
                              child: Row(
                                children: <Widget>[
                                  Flexible(
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          'D.) ${cppList[index].option4}',
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
                        onTap: (){
                          if(current4 == inactive){
                            setState(() {
                              current4 = active;
                              current1 = inactive;
                              current2 = inactive;
                              current3 = inactive;
                              selected = "";
                              selected = cppList[index].option4;

                            });
                          }
                          else if(current4 == active){
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
                  ]
              ),
            ),





            SizedBox(height: 40,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[





                (index<cppList.length-1)?Container(
                  width: 120,
                  height: 40,
                  child: FlatButton(
                    color: Colors.greenAccent,

                    child: Text('Next',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    onPressed: (){

                      if(selected == cppList[index].answer){

                        setState(() {
                          score = score+1;
                        });
                      }
                      else{

                      }

                      if(index< cppList.length-1){
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
                ):Container(
                  width: 120,
                  height: 40,
                  child: FlatButton(
                    color: Colors.blueAccent,
                    child: Text('Submit',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: (){
                      if(selected == cppList[index].answer){

                        setState(() {
                          score = score+1;
                        });
                      }
                      else{

                      }

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ResultPage(score: score, totalQuestions: cppList.length,)),
                      );

                    },

                  ),
                ),
              ],
            ),

            SizedBox(height: 100,),






          ],
        ),
      ),

    );
  }
}


