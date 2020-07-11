import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    List<Job> jobList = [];
    jobList.add(Job('https://blog.hubspot.com/hubfs/image8-2.jpg','Google','This post is about job in Google'));
    jobList.add(Job('https://cdn.vox-cdn.com/thumbor/NeSo4JAqv-fFJCIhb5K5eBqvXG4=/7x0:633x417/1200x800/filters:focal(7x0:633x417)/cdn.vox-cdn.com/assets/1311169/mslogo.jpg','Microsoft','This post is about job in Microsoft'));
    jobList.add(Job('https://i.dlpng.com/static/png/6739214_preview.png','Amazon','This post is about job in Amazon'));

    print(jobList);

    return Scaffold(
      appBar: homeAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            SizedBox(height: 20,),

            Center(
              child: Text(
                'Available jobs',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
            ),

            SizedBox(height: 40,),

            ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: jobList.length,
              itemBuilder: (BuildContext context, int index) {
                Job jb = jobList[index];
                return Padding(
                  padding: const EdgeInsets.only(top:16.0,bottom: 32,left: 16,right: 16),
                  child: Material(
                    elevation: 15,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: 150,maxHeight: 500,),
                      child: Container(

                        decoration: BoxDecoration(
                            color: Colors.white70,
                            border: Border.all(
                              width: 2,
                              color: Color(0xffE2E7F2),
                            )
                        ),
                        child:Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[


                                     Expanded(
                                       flex:2,
                                       child: Container(

                                         decoration: BoxDecoration(
                                           image: DecorationImage(
                                             fit: BoxFit.fill,
                                               image: NetworkImage(
                                                 '${jb.imageUrl}',
                                               ),
                                           ),
                                           color: Colors.grey,
                                           borderRadius: BorderRadius.all(
                                             Radius.circular(10),
                                           ),



                                         ),



                                    ),
                                     ),



                              SizedBox(height: 10,),


                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      decoration: BoxDecoration(

                                        color: Color(0xffE2E7F2),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),


                                      ),

                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Flexible(
                                                  child: Text(
                                                    '${jb.jobName}',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 40,

                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),

                                            SizedBox(height: 20,),

                                            Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child: Text(
                                                    '${jb.jobInfo}',
                                                    style: TextStyle(
                                                      color: Colors.blueAccent,

                                                      fontSize: 20,

                                                    ),
                                                  ),
                                                ),

                                              ],
                                            ),

                                            Expanded(child: SizedBox(width: 1,)),

                                            Container(
                                              height:50,
                                              width: 100,
                                              color: Colors.green,
                                              child: FlatButton(
                                                child: Text('Apply',style: TextStyle(color: Colors.white),),
                                                onPressed: (){},
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),

                            ],

                          ),
                        )
                      ),
                    ),
                  ),
                );
              },


            )
            
          ],
        ),
      ),
    );
  }
}

class Job{
  String imageUrl;
  String jobName;
  String jobInfo;

  Job(this.imageUrl,this.jobName,this.jobInfo);

}
