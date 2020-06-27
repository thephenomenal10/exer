import 'dart:async';

import 'package:flutter/material.dart';
import 'package:exerholic/Authentication/SignPage.dart';
import 'package:exerholic/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:exerholic/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exerholic/Administrator/dashboard.dart';




class IsUserLoggedIn extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return IsUserLoggedInState();
  }

}

class IsUserLoggedInState extends State<IsUserLoggedIn> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user = null;


  service fobj = new service();
  QuerySnapshot personaldata;

//  String email;
  Future<void> getUserData() async {
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();
    setState(() {
      user = userData;
    });
  }

  @override
  void initState() {
    fobj.getpersonaldata().then((results) {
      setState(() {
        personaldata = results;
      });
    });
    getUserData();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(personaldata!=null)
    {
      return   getRole(context);
    }
    else{
      return Scaffold(
        body: Center(
            child: Text("Welcome to Exerholic App",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold ),)
        ),

      );
    }

  }

  Widget getRole(context) {
    if(_auth.currentUser()!=null&&user!=null){
      for(int i=0;i<personaldata.documents.length;i++)
      {
        if(personaldata.documents[i].documentID==user.email)
        {
          if(personaldata.documents[i].data['Role']=='Admin')
            return Dashboard();
          else
            return HomePage();
        }
      }
    }
    else{

      return SignInPage();
    }
  }
}