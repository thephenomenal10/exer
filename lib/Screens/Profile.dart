import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exerholic/Screens/MyAppBar.dart';
import 'package:exerholic/Screens/PersonalDetails.dart';
import 'package:exerholic/Screens/calculateBMI.dart';
import 'package:exerholic/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

import '../constants.dart';



class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProfileState();
  }

}

class ProfileState extends State<Profile> {

  FirebaseUser user;
  service fobj = new service();
  QuerySnapshot personaldata;
  StorageReference storageReference = FirebaseStorage.instance.ref().child("user_profile");

  Uint8List imageFile;
  File _image;



  saveImageToFirebase(a) {

    storageReference.child("image_$a.jpg").putFile(_image);
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
      saveImageToFirebase(user.email);
      fetchImageFromFirebase(user.email);
    });
  }



  fetchImageFromFirebase(a) {
    int maxSize = 5*1024*1024;
    storageReference.child("image_$a.jpg").getData(maxSize).then((value){
        setState(() {
          imageFile = value;
        });
    });
  }


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
        fetchImageFromFirebase(user.email);

      });
    });
    getUserData();
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    if (personaldata != null) {
      return new Scaffold(
        appBar: PreferredSize(
          child: MyAppBar(),
          preferredSize: Size.fromHeight(60.0),
        ),
        body: _showProfile(),
      );
    } else {
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

  _showProfile() {

    String name='',gender='',height='',weight='',phone='',workout='',dob='';
    String a = user.email;
//    fetchImageFromFirebase(user.email);

//    print(a);

    if (personaldata != null) {
      for (int i = 0; i <   personaldata.documents.length; i++) {
        if (a == personaldata.documents[i].documentID) {
          name= (personaldata.documents[i].data['Name']) ;
          phone= personaldata.documents[i].data['Phone'];
          gender=personaldata.documents[i].data['Gender'];
          dob= personaldata.documents[i].data['DOB'];
          height= personaldata.documents[i].data['Height'];
          weight=personaldata.documents[i].data['Weight'];
          workout=personaldata.documents[i].data['Workout'];
          return SafeArea(
            child: Card(
              margin: EdgeInsets.all(20),
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: ListView(
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.all(20),
                    width: double.infinity,
                    child: Column(

                      children: <Widget>[

                        imageFile == null
                        ? GestureDetector(
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 70.0,
                            child: Icon(Icons.add_a_photo, size: 40.0,),
                          ),
                          onTap: getImage,
                        )
                        : GestureDetector(
                          child: CircleAvatar(
                            radius: 70.0,
                            backgroundImage: MemoryImage(imageFile),
                          ),
                          onTap: getImage,
                        ),
                        SizedBox(height: 20,),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 20.0, right: 5.0, top: 5.0),
                            child: new Row(

                              children: <Widget>[
                                new Text(
                                  "Name : ",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      letterSpacing: 1.2,
                                      fontWeight: FontWeight.bold),
                                ),
                                Flexible(
                                  child: new Text(
                                    "$name",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ],
                            )
                        ),
                        SizedBox(height: 20,),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 20.0, right: 5.0, top: 5.0),
                            child: new Row(

                              children: <Widget>[
                                new Text(
                                  "Email : ",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      letterSpacing: 1.2,
                                      fontWeight: FontWeight.bold),
                                ),
                                Flexible(
                                  child: new Text(
                                    "$a",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ],
                            )
                        ),

                        Padding(
                            padding: EdgeInsets.only(
                                left: 20.0, right: 5.0, top: 20.0),
                            child: new Row(
                              children: <Widget>[
                                new Text(
                                  "Phone Number : ",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      letterSpacing: 1.2,
                                      fontWeight: FontWeight.bold),
                                ),
                                Flexible(
                                  child: new Text(
                                    "$phone",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ],
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 20.0, right: 5.0, top: 20.0),
                            child: new Row(
                              children: <Widget>[
                                new Text(
                                  "Gender : ",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      letterSpacing: 1.2,
                                      fontWeight: FontWeight.bold),
                                ),
                                new Text(
                                  "$gender",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 20.0, right: 5.0, top: 20.0),
                            child: new Row(

                              children: <Widget>[
                                new Text(
                                  "Date oF birth : ",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      letterSpacing: 1.2,
                                      fontWeight: FontWeight.bold),
                                ),
                                new Text(
                                  "$dob",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            )
                        ),

                        Padding(
                            padding: EdgeInsets.only(
                                left: 20.0, right: 5.0, top: 20.0),
                            child: new Row(

                              children: <Widget>[
                                new Text(
                                  "Height :   ",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      letterSpacing: 1.2,
                                      fontWeight: FontWeight.bold),
                                ),
                                Flexible(
                                  child: new Text(
                                    "$height",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ],
                            )
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 20.0, right: 5.0, top: 20.0),
                            child: new Row(
                              children: <Widget>[
                                new Text(
                                  "Weight :  ",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      letterSpacing: 1.2,
                                      fontWeight: FontWeight.bold),
                                ),
                                new Text(
                                  "$weight",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            )
                        ),

                        Padding(
                            padding: EdgeInsets.only(
                                left: 20.0, right: 5.0, top: 20.0),
                            child: new Row(

                              children: <Widget>[
                                new Text(
                                  "Workout Hours : ",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      letterSpacing: 1.2,
                                      fontWeight: FontWeight.bold),
                                ),
                                new Text(
                                  "$workout",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            )
                        ),
                        SizedBox(height: 20,),
                        RaisedButton.icon(
                            color: Colors.pink,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white70, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            onPressed:() {
                              Navigator.pushReplacement(context, MaterialPageRoute(
                                  builder: (context) => CalculateBMI()));
                            },
                            icon: Icon(Icons.accessibility,color: Colors.white,),
                            label:Text("Check BMI",style: TextStyle(color: Colors.white),)
                        ),
                        SizedBox(height: 20,),
                        RaisedButton.icon(
                            color: Colors.pink,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white70, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            onPressed:() {
                              Navigator.pushReplacement(context, MaterialPageRoute(
                                  builder: (context) => PersonalDetails()));
                            },
                            icon: Icon(Icons.edit,color: Colors.white,),
                            label:Text("Edit",style: TextStyle(color: Colors.white),)
                        )
                      ],
                    ),
                  ),
                ],

              ),
            ),
          );

        }
      }
    }
  }
}