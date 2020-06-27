import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exerholic/Screens/AddWorkout.dart';
import 'package:exerholic/Screens/MyAppBar.dart';
import 'package:exerholic/Widgets/dialogBox.dart';
import 'package:exerholic/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:exerholic/Widgets/globalVariable.dart' as global;

import '../homePage.dart';

class Hiit extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return HiitState();
  }

}

class HiitState extends State<Hiit>{

  double rating = 4;
  int starCount = 5;
  service fobj=new service();
  QuerySnapshot packagedata;
  @override
  void initState(){
    fobj.getpackagedata().then((result){
      setState(() {
        packagedata=result;
      });

    });
  }
  int i;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(packagedata!=null) {
      for (i = 0; i < packagedata.documents.length; i++) {
        if ('Hiit' == packagedata.documents[i].documentID) {
          break;
        }
      }
      return new Scaffold(

          appBar: PreferredSize(
            child: MyAppBar(),
            preferredSize: Size.fromHeight(60.0),
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 50,),
              child: Column(

                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fhiit.png?alt=media&token=c70acc8d-5e6f-4910-a080-21b67d174ade"),
                                fit: BoxFit.fitHeight,
                                colorFilter: new ColorFilter.mode(Colors.black
                                    .withOpacity(0.8), BlendMode.dstATop)
                            ),
                            borderRadius: BorderRadius.circular(12)
                        ),
                      ),
                      Flexible(
                        child: Container(
                          margin: EdgeInsets.only(left: 20,),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "HIIT                                              ",
                                style: TextStyle(fontSize: 25,
                                    fontWeight: FontWeight.bold),),
                              Container(
                                margin: EdgeInsets.only(top: 7),
                                child: Row(
                                  children: <Widget>[
                                    Text("Intensity Level:- ", style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),),
                                    StarRating(
                                      size: 15.0,
                                      rating: rating,
                                      color: Colors.orange,
                                      borderColor: Colors.grey,
                                      starCount: starCount,
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 7),
                                child: Row(
                                  children: <Widget>[
                                    Text("Trainee Name :-", style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),),
                                    Text("${packagedata.documents[i].data['Trainee Name']}",
                                      style: TextStyle(fontSize: 15),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 1,
                    margin: const EdgeInsets.all(20.0),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                        color: Colors.black
                    ),

                  ),
                  Container(
                    height: 20,
                    margin: EdgeInsets.only(left: 5, right: 270),
                    child: Text("Description:-", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      decoration: TextDecoration.underline,),),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        "${packagedata.documents[i].data['Description']}",
                        style: TextStyle(fontSize: 15,),),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 20,top: 20),
                    child: Row(
                      children: <Widget>[
                        Text("Burns Calories ", style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),),
                        SizedBox(width: 170,),
                        Icon(
                          Icons.check,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Row(
                      children: <Widget>[
                        Text("Work on balance and coordination",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),),
                        SizedBox(width: 60,),
                        Icon(
                          Icons.check,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Row(
                      children: <Widget>[
                        Text("Builds lean muscle mass", style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),),
                        SizedBox(width: 114,),
                        Icon(
                          Icons.check,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Row(
                      children: <Widget>[
                        Text("Reduce the risk on injuries ", style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),),
                        SizedBox(width: 100,),
                        Icon(
                          Icons.check,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Row(
                      children: <Widget>[
                        Text("Challenging ", style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),),
                        SizedBox(width: 185,),
                        Icon(
                          Icons.check,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        height:55,
                        margin: EdgeInsets.only(left: 25,top: 50),
                        child: Text("Price     :   Rs   ${packagedata.documents[i].data['Price']}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,),),
                      ),
                    ],
                  ),
                 Container(
                    margin: EdgeInsets.only(top: 40),
                    child: RaisedButton(
                      color: Colors.pink,
                      onPressed: () {
                        if (global.isGuest == true) {
                          alertDialog(
                              context,
                              "You are not logged in, Please login First",
                              HomePage());
                        } else {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddWorkout()));
                        }
                      },
                      child: Text(
                        "Book Now",
                        style: new TextStyle(fontSize: 22, color: Colors.white),
                      ),
                    ),
                  )


                ],
              ),
            ),
          )
      );
    }
    else{
      return Scaffold(
        body: Center(
          child: LoadingBouncingGrid.circle(
            size: 30,
            backgroundColor: Colors.pink,
          ),
        ),
      );
    }
  }
}