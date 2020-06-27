import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exerholic/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:material_dropdown_formfield/material_dropdown_formfield.dart';

import '../constants.dart';
import '../services.dart';

class PersonalDetails extends StatefulWidget {
  @override
  _PersonalDetailsState createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {

  FirebaseUser user;
  service fobj=new service();
  QuerySnapshot personaldata;
  String name='',gender='',weight='',bmi='',height='',workout='',phone='',dob1='';

  int count=0;
  String workout1,gender1;

  Future<void>getUserData()async{
    FirebaseUser userData=await FirebaseAuth.instance.currentUser();
    setState(() {
      user=userData;
    });
  }
  List dataSource=[
    {
      "display": "    Male",
      "value": "Male",
    },
    {
      "display": "    Female",
      "value": "Female",
    },
    {
      "display": "    Others",
      "value": "Others",
    },
  ];
  List dataSource1=[
    {
      "display": "    1 hour",
      "value": "1",
    },
    {
      "display": "    2 hour",
      "value": "2",
    },
    {
      "display": "    3 hour",
      "value": "3",
    },
  ];
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  final format = DateFormat("yyyy-MM-dd");

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
    if(personaldata!=null){

      for(int i=0;i<personaldata.documents.length;i++)
      {
        if(personaldata.documents[i].documentID==user.email)
        {
          name=personaldata.documents[i].data['Name'];
          gender=personaldata.documents[i].data['Gender'];
          weight=personaldata.documents[i].data['Weight'];
          height=personaldata.documents[i].data['Height'];
          workout=personaldata.documents[i].data['Workout'];
          dob1=personaldata.documents[i].data['DOB'];
          phone=personaldata.documents[i].data['Phone'];

          break;
        }
      }
      return Scaffold(
        body: SingleChildScrollView(
          child:Form(
              key: _formKey,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50.0,top: 50.0,right: 60),
                      child: Text(
                        'Edit Your Profile',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 30.0),
                  _buildnameTF(),
                  SizedBox(height: 30.0),
                  _buildgenderTF(),
                  SizedBox(height: 30.0),
                  _buildheightTF(),
                  SizedBox(height: 30.0),
                  _buildweightTF(),
                  SizedBox(height: 30.0),
                  _buildworkoutTF(),
                  SizedBox(height: 30.0),






                  SizedBox(height: 5.0,),
                  Container(
                    margin: EdgeInsets.only(left: 150),
                    child: Row(
                      children: <Widget>[
                        RaisedButton(
                          color:Colors.pink,
                          child: Text("Submit"),
                          onPressed: (){

                            if(_formKey.currentState.validate()) {
                              if(count!=2) {
                                fobj.addPersonalData({
                                  'Name':this.name,
                                  'Weight':this.weight,
                                  'Height':this.height,
                                  'Workout':this.workout1==null?this.workout:this.workout1,
                                  'Gender':this.gender1==null?this.gender:this.gender1,
                                  'DOB':this.dob1,
                                  'Phone':this.phone,

                                },user.email).then((result) {
                                  Navigator.pushReplacement(context, MaterialPageRoute(
                                      builder: (context) => HomePage()));
                                  _adddialog(context);
                                }).catchError((e) {
                                  print(e);
                                });
                              }else{
                                _addDialog(context);
                              }
                            }
                            fobj.getpersonaldata().then((results) {
                              setState(() {
                                personaldata = results;
                              });
                            });
                          },
                        ),
                      ],
                    ),
                  )

                ],

              ) ) ,
        ),
      );
    }else{
      return  Scaffold(
        body: Center(
          child: LoadingBouncingGrid.circle(
            size: 30,
            backgroundColor: Colors.pink,
          ),
        ),
      );
    }

  }
  Future<bool> _adddialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Profile Updated successfully", style: TextStyle(fontSize: 15.0)),
          actions: <Widget>[
            FlatButton(
              child: Text("OK",),
              textColor: Colors.pink,
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
  Widget _buildnameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Enter Your Name",
          style: kLabelStyle,
        ),
        SizedBox(height: 5.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          margin: EdgeInsets.only(top: 10,bottom: 5),
          height: 60,
          width: 330,
          child: TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(15.0),
              hintText: '${name}',
              hintStyle: kHintTextStyle,
            ),
            onChanged: (input) => this.name = input,
          ),
        ),
      ],
    );
  }

  Widget _buildgenderTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Enter Your Gender",
          style: kLabelStyle,
        ),
        SizedBox(height: 5.0),
        Container(
          decoration: kBoxDecorationStyle,
          margin: EdgeInsets.symmetric(vertical: 5),
          height: 60,
          width: 330,

          child:DropDownFormField(

            inputDecoration: InputDecoration.collapsed(

            ),
            hintText: '     ${gender}',

            value: gender1,
            onSaved: (value) {
              setState(() {
                gender1 = value;
              });
            },
            onChanged: (value) {
              setState(() {
                this.gender1 = value;
              });
            },
            dataSource: dataSource,
            textField: 'display',
            valueField: 'value',
          ),
        ),
      ],
    );
  }
  Widget _buildweightTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Your Weight in kg",
          style: kLabelStyle,
        ),
        SizedBox(height: 5.0),
        Container(
          decoration: kBoxDecorationStyle,
          margin: EdgeInsets.symmetric(vertical: 5),
          height: 60,
          width: 330,
          child:TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(15.0),
              hintText: '${weight}',
              hintStyle: kHintTextStyle,
            ),
            onChanged: (input) => this.weight = input,
          ),


        ),
      ],
    );
  }
  Widget _buildheightTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Your Height in cm",
          style: kLabelStyle,
        ),
        SizedBox(height: 5.0),
        Container(

          decoration: kBoxDecorationStyle,
          margin: EdgeInsets.symmetric(vertical: 5),
          height: 60,
          width: 330,
          child:TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(15.0),
              hintText: '${height}',
              hintStyle: kHintTextStyle,
            ),
            onChanged: (input) => this.height = input,
          ),


        ),
      ],
    );
  }

  Widget _buildworkoutTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Your Workout",
          style: kLabelStyle,
        ),
        SizedBox(height: 5.0),
        Container(
          decoration: kBoxDecorationStyle,
          margin: EdgeInsets.symmetric(vertical: 5),
          height: 60,
          width: 330,
          child:DropDownFormField(
            inputDecoration: InputDecoration.collapsed(),
            hintText: '     ${workout}',

            value: this.workout1,
            onSaved: (value) {
              setState(() {
                this.workout1 = value;
              });
            },
            onChanged: (value) {
              setState(() {
                this.workout1 = value;
              });
            },
            dataSource: dataSource1,
            textField: 'display',
            valueField: 'value',
          ),
        ),
      ],
    );
  }
  Future<dynamic>_addDialog(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: Text("user with this number is already registered.Try using other phone number")),
            content: SingleChildScrollView(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left:70),
                    child: Center(
                      child: RaisedButton(
                        color: Colors.pink,
                        child: Text("ok",style: TextStyle(fontSize: 20),),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          );

        }


    );

  }
  String validatephone(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length != 10 || value.length == 0) {

      return 'Phone must be of 10 digit';
    }
    else {

      return null;
    }
  }

}