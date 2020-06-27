import 'package:exerholic/Administrator/dashboard.dart';
import 'package:exerholic/Authentication/ResetPass.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:exerholic/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exerholic/homepage.dart';
import 'package:exerholic/Authentication/SignUpPage.dart';
import 'package:exerholic/Widgets/globalVariable.dart' as global;
import 'package:exerholic/services.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

FirebaseUser user;

class _SignInPageState extends State<SignInPage> {
  double width;

  bool checkBoxValue = false;
  bool _obscureText = true;
  String _email, _password;
  String role;

  service fobj = new service();
  QuerySnapshot personaldata;

  String email1;

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

    global.isGuest = false;
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 10.0,
        ),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(left: 0.0, top: 40.0, right: 210),
                  child: Text(
                    'Log in',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  decoration: kBoxDecorationStyle,
                  margin: EdgeInsets.only(top: 20, bottom: 5),
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
                    onSaved: (input) => _email = input,
                  ),
                ),
                Container(
                  decoration: kBoxDecorationStyle,
                  margin: EdgeInsets.only(top: 20, bottom: 5),
                  height: 60,
                  width: 330,
                  child: TextFormField(
                    validator: validatePassword,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      suffix: IconButton(
                        icon: Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: _obscureText
                                ? Icon(Icons.remove_red_eye)
                                : Icon(Icons.close)),
                        iconSize: 20,
                        onPressed: _toggle,
                      ),
                      contentPadding: EdgeInsets.only(left: 15, bottom: 20),
                      hintText: 'Enter your Password',
                      hintStyle: kHintTextStyle,
                    ),
                    obscureText: _obscureText,
                    onSaved: (input) => _password = input,
                  ),
                ),
                Container(
                    height: 60,
                    child: SingleChildScrollView(
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(width / 100),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(5.0),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(right: width / 70),
                              child: FlatButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ResetPass()));
                                  },
                                  child: Text(
                                    "Forgot Password ?",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  )))
                        ],
                      ),
                    )),
                SizedBox(
                  height: 10.0,
                ),
                RaisedButton(
                  elevation: 10,
                  onPressed: () {
                    _handleSubmit(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 100.0, right: 100.0, top: 10.0, bottom: 10.0),
                    child: Text(
                      'Log In',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  color: Colors.pink,
                ),
                SizedBox(height: 40.0),
                Container(
                  child: RaisedButton(
                    elevation: 8,
                    onPressed: () {
                      setState(() {
                        global.isGuest = true;
                      });
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 100.0, right: 100.0, top: 10.0, bottom: 10.0),
                      child: Text(
                        'Guest Login',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    color: Colors.pink,
                  ),
                ),
                // SizedBox(height: 20.0),
                Container(
                    height: 60,
                    child: SingleChildScrollView(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            // margin: EdgeInsets.only(
                            //     left: width / 50, right: 0.0, top: 10.0),
                            child: Text("Don't have an account ?",
                                style: TextStyle(
                                  fontSize: 15,
                                )),
                          ),
                          Container(
                              child: FlatButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignUpPage()));
                                  },
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ))),
                          SizedBox(height: 30.0),
                        ],
                      ),
                    )),
              ],
            )),
      ),
    );
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter Valid Email';
    } else {
      return null;
    }
  }

  String validatePassword(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length < 6) {
      return 'Password must be of atleast 6 digit';
    } else {
      return null;
    }
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Future<void> _handleSubmit(BuildContext context) async {
    try {
      //invoking login
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();

        showLoadingDialog(context, _keyLoader);
        try {
          AuthResult result = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: _email, password: _password);
          email1 = result.user.email;
          getRole();
        } catch (e) {
          _addDialog(context);

          return (e.message);
        }
      }
      //close the dialoge

    } catch (error) {
      Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
      print(error);
    }
  }

  getRole() {
    if (personaldata != null) {
      for (int i = 0; i < personaldata.documents.length; i++) {
        if (personaldata.documents[i].documentID == email1) {
          if (personaldata.documents[i].data['Role'] == 'Admin') {
            Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Dashboard()));
          } else {
            Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          }
        }
      }
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
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Please Wait....",
                          style: TextStyle(color: Colors.blueAccent),
                        )
                      ]),
                    )
                  ]));
        });
  }

  _addDialog(BuildContext context) {
    Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.only(left: 25, right: 25, top: 10),
            content: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: new Text("Invalid Email or Password."),
                    ),
                    Container(
                      child: new Text("Please provide correct credentials."),
                    )
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Back'),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
