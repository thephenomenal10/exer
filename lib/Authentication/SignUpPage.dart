import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:exerholic/Authentication/SignPage.dart';
import 'package:exerholic/constants.dart';
import 'package:exerholic/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_dropdown_formfield/material_dropdown_formfield.dart';

import '../services.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  service fobj=new service();

  TextEditingController _dateController = new TextEditingController();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  bool _obscureText = true;
  QuerySnapshot personaldata;

  String _mobile, _password;
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
  final format = DateFormat("yyyy-MM-dd");
  String name, email, weight, height, bmi, workout, gender, phone;
  DateTime dob;
  @override
  void initState() {
    fobj.getpersonaldata().then((result){
      setState(() {
        personaldata=result;
      });

    });
    super.initState();
    gender = '';

  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    if(personaldata!=null) {
      return Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 20.0,
          ),
          child:Form(
              key: _formKey,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50.0,top: 40.0,right: 60),
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,

                        ),

                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: kBoxDecorationStyle,
                    margin: EdgeInsets.only(top: 20,bottom: 5),
                    height: 60,
                    width: 330,
                    child: TextFormField(


                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(15.0),
                        hintText: 'Enter your name',
                        hintStyle: kHintTextStyle,
                      ),
                      onSaved: (input) => name = input,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: kBoxDecorationStyle,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    height: 60,
                    width: 330,
                    child: TextFormField(
                      validator: validateEmail,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(15.0),
                        hintText: 'Enter your email',
                        hintStyle: kHintTextStyle,
                      ),
                      onSaved: (input) => email = input,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: kBoxDecorationStyle,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    height: 60,
                    width: 330,
                    child: TextFormField(
                      validator: validatephone,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(15.0),
                        hintText: 'Enter your mobile number',
                        hintStyle: kHintTextStyle,
                      ),
                      onChanged: (input) => this.phone = input,

                    ),
                  ),
                  Container(

                    decoration: kBoxDecorationStyle,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    height: 60,
                    width: 330,
                    child:TextFormField(
                      validator: validatePassword,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        suffix: IconButton(
                          icon: Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: _obscureText?Icon(Icons.remove_red_eye):Icon(Icons.close)),
                          iconSize: 20,
                          onPressed:_toggle,
                        ),
                        contentPadding: EdgeInsets.only(left: 15,bottom: 20),
                        hintText: 'Enter your Password',
                        hintStyle: kHintTextStyle,
                      ),
                      obscureText: _obscureText,
                      onSaved: (input) => _password = input,
                    ),
                  ),
                  Container(
                    decoration: kBoxDecorationStyle,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    height: 60,
                    width: 330,

                    child:DropDownFormField(

                      inputDecoration: InputDecoration.collapsed(

                      ),
                      hintText: '     Pick your gender',

                      value: gender,
                      onSaved: (value) {
                        setState(() {
                          gender = value;
                        });
                      },
                      onChanged: (value) {
                        setState(() {
                          gender = value;
                        });
                      },
                      dataSource: dataSource,
                      textField: 'display',
                      valueField: 'value',
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    height: 60,
                    width: 330,
                    decoration: kBoxDecorationStyle,
                    child: DateTimeField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(15.0),
                        hintText: 'Enter your date of birth',
                        hintStyle: kHintTextStyle1,
                      ),
                      format: format,
                      onShowPicker: (context, currentValue) {
                        return showDatePicker(
                            context: context,
                            firstDate: DateTime(1900),
                            initialDate: currentValue ?? DateTime.now(),
                            lastDate: DateTime(2021));
                      },
                      onChanged: (value){
                        this.dob=value;
                      },
                      controller: _dateController,
                    ),
                  ),
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
                        hintText: 'Enter your weight in KG',
                        hintStyle: kHintTextStyle,
                      ),
                      onSaved: (input) => weight = input,
                    ),


                  ),
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
                        hintText: 'Enter your height in CM',
                        hintStyle: kHintTextStyle,
                      ),
                      onSaved: (input) => height = input,
                    ),


                  ),

                  Container(
                    decoration: kBoxDecorationStyle,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    height: 60,
                    width: 330,
                    child:DropDownFormField(
                      inputDecoration: InputDecoration.collapsed(),
                      hintText: '     Pick your workout hours',

                      value: workout,
                      onSaved: (value) {
                        setState(() {
                          workout = value;
                        });
                      },
                      onChanged: (value) {
                        setState(() {
                          workout = value;
                        });
                      },
                      dataSource: dataSource1,
                      textField: 'display',
                      valueField: 'value',
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  RaisedButton(
                    elevation: 10,
                    onPressed: () {
                      signUp();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 100.0,right: 100.0,top: 10.0,bottom: 10.0),
                      child: Text('Sign Up',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                    ),
                    color: Colors.pink
                  ),
                  Container(
                      height: 60,
                      child: SingleChildScrollView(
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 15.0,right: 0.0,top: 10.0),
                              child: Text("Already have an account ?",style: TextStyle(fontSize: 20,)),
                            ),
                            Container(
                                margin: EdgeInsets.only(left:0.0,right: 0.0,top: 10.0),
                                child: FlatButton(
                                    onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) =>SignInPage()));
                                    },
                                    child: Text("Sign In",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.pink,),)


                                )
                            )
                          ],
                        ),
                      )
                  ),
                ],

              ) ) ,
        ),
      );

    }else{
      return Container(
        height: 0.0,
        width: 0.0,
        color: Colors.white,
      );
    }
  }
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: key,
                  backgroundColor: Colors.black54,
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 10,),
                        Text("Please Wait....",style: TextStyle(color: Colors.pink),)
                      ]),
                    )
                  ]));
        });
  }
  void signUp() async {
    int count=0;

    for(int i=0;i<personaldata.documents.length;i++)
    {
      if(this.phone==personaldata.documents[i].data['Phone'])
      {
        count=1;
        break;
      }
    }
    if (_formKey.currentState.validate()) {
      if (count == 0) {
        _formKey.currentState.save();

        try {
          showLoadingDialog(context, _keyLoader);
          AuthResult result = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
              email: email, password: _password);

          fobj.addPersonalData({
            'Name': this.name,
            'Weight': '${this.weight} Kg',
            'Height': '${this.height} Cm',
            'Workout': this.workout,
            'Gender': this.gender,
            'DOB': _dateController.text,
            'Phone': this.phone,
             'Free Workout':'1'
          }, this.email).then((result) {}).catchError((e) {
            print(e);
          });
          Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
          // var user = result.user;
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        } catch (e) {
          return (e.message);
        }
      } else {
        _addDialog(context);
      }
    }

  }
  String validatePassword(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length < 6) {

      return 'Password must be of atleast 6 digit';
    }
    else {

      return null;
    }
  }
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {

      return 'Enter Valid Email';
    }
    else {

      return null;
    }
  }
  String validatephone(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length != 10) {

      return 'Phone must be of 10 digit';
    }
    else {

      return null;
    }
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
}