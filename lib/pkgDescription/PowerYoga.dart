import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exerholic/Screens/AddWorkout.dart';
import 'package:exerholic/Screens/MyAppBar.dart';
import 'package:exerholic/Widgets/dialogBox.dart';
import 'package:flutter/material.dart';
import 'package:exerholic/Widgets/globalVariable.dart' as global;

import 'package:flutter_rating/flutter_rating.dart';
import 'package:loading_animations/loading_animations.dart';

import '../homePage.dart';
import '../services.dart';

class PowerYoga extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return PowerYogaState();
  }

}

class PowerYogaState extends State<PowerYoga>{

  double width,height;
  double rating = 3.5;
  int starCount = 5;
  service fobj=new service();
  QuerySnapshot packagedata;
  @override
  void initState(){
    fobj.getpackagedata().then((result){
      setState(() {
        packagedata = result;
      });
    });
  }
    int i;
  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    // TODO: implement build
  if(packagedata!=null) {
    for(i=0;i<packagedata.documents.length;i++)
    {
      if('PowerYoga'==packagedata.documents[i].documentID)
      {
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
                              image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fpower_yoga.png?alt=media&token=468164a1-e941-40f6-9cbf-bc90a37067d7"),
                              fit: BoxFit.fitHeight,
                              colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop)
                          ),
                          borderRadius: BorderRadius.circular(12)
                      ),
                    ),
                    Flexible(
                      child: Container(
                          margin: EdgeInsets.only(left: 20,),
                          child: Column(
                            children: <Widget>[
                              Text("Power Yoga                          ",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                              Container(
                                margin: EdgeInsets.only(top: 7),
                                child: Row(
                                  children: <Widget>[
                                    Text("Intensity Level:- ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
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
                                    Text("Trainee Name :-",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                    Text("${packagedata.documents[i].data['Trainee Name']}",style: TextStyle(fontSize: 15),),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 7),
                                child:Text("Power yoga is customizable yoga style influenced by aerobics exercise.",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),



                              )

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
                  height:20,
                  margin: EdgeInsets.only(left: 5,right: 270),
                  child: Text("Description:-",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,decoration:TextDecoration.underline,),),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${packagedata.documents[i].data['Description']}",
                    style: TextStyle(fontSize: 15,),),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Row(
                    children: <Widget>[
                      Flexible(child: Text("Improve blood circulation and immune system",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                      SizedBox(width: 10,),
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
                      Flexible(child: Text("Stengthens bones, muscle and joints",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                      SizedBox(width: 20),
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
                      Flexible(child: Text("Promote Stamina and flexibility",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
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
                      Flexible(child: Text("Increased Concentration ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                      SizedBox(width:110),
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
                      Flexible(child: Text("Decrease Stress",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                      SizedBox(width:180),
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
                      margin: EdgeInsets.only(left: 25,top: 30),
                      child: Text("Price     :  Rs    ${packagedata.documents[i].data['Price']}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,),),
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
    return new Scaffold(
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