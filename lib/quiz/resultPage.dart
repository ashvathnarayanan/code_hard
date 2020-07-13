import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:version1/screens/Home_screen.dart';
import 'package:version1/widgets/app_bar.dart';
import 'package:percent_indicator/percent_indicator.dart';


// ignore: must_be_immutable
class ResultPage extends StatefulWidget {
  int score;
  int totalQuestions;

  ResultPage({
    this.score,
    this.totalQuestions
});



  @override
  _ResultPageState createState() => _ResultPageState(
    score,
    totalQuestions,
  );
}

class _ResultPageState extends State<ResultPage> {
  int score;
  int totalQuestions;

  _ResultPageState(
      this.score,
      this.totalQuestions,
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      body: SingleChildScrollView(

        child: Column(
          children: <Widget>[
            Center(
              child: Text(
                'Test result',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: 40,),

            ConstrainedBox(
              constraints: BoxConstraints(

                maxWidth: 400,
              ),
              child: Container(

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),

                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF667db6),
                      Color(0xFF0082c8),
                      Color(0xFF667db6),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight
                  )
                ),

                child: Column(
                  children: <Widget>[

                    Padding(
                      padding: const EdgeInsets.only(left: 16,right:16,top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              'You have answered $score out of $totalQuestions questions correctly.',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                     SizedBox(height: 20,),

                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         CircularPercentIndicator(
                          radius: 130.0,
                          animation: true,
                          animationDuration: 1200,
                          lineWidth: 5.0,
                          percent: score/totalQuestions,
                          center: new Text(
                            "${(score/totalQuestions)*100}%",

                            style:
                            new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,color: Colors.white),
                          ),
                          circularStrokeCap: CircularStrokeCap.butt,
                          backgroundColor: Colors.green,
                          progressColor: Colors.white,
                    ),
                       ],
                     ),

                    SizedBox(height: 20,),

                    //PASS IF >=50%
                    ((score/totalQuestions) >= 0.5)?Padding(
                      padding: const EdgeInsets.only(left: 16,right:16,top: 20,bottom: 20,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              'Congratulations! You have passed the test. 🎊',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),

                            ),
                          )
                        ],
                      ),
                    ):Padding(
                      padding: const EdgeInsets.only(left: 16,right:16,top: 20,bottom: 20),
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              'Sorry. You have not cleared the test.',
                              style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 300,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(15),
                        ),

                        child: FlatButton(

                          child: Text(
                            'Back to home',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,

                            ),
                          ),
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomePage()),
                            );
                          },
                        ),
                      )
                    ],
                  )
          ],
        ),

      ),
    );

  }
}
