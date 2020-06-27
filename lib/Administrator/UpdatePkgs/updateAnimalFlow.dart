import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exerholic/Administrator/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

import '../../constants.dart';
import '../../services.dart';

class UpdateAnimalFlow extends StatefulWidget {
  @override
  _UpdateAnimalFlowState createState() => _UpdateAnimalFlowState();
}

class _UpdateAnimalFlowState extends State<UpdateAnimalFlow> {
  FirebaseUser user;
  service fobj = new service();
  QuerySnapshot packagedata;

  String description, price, trainee;
  int i;
  String docId;

  final GlobalKey<State> _formKey = new GlobalKey<State>();

  @override
  void initState() {
    fobj.getpackagedata().then((result) {
      setState(() {
        packagedata = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (packagedata != null) {
      for (i = 0; i < packagedata.documents.length; i++) {
        if ('AnimalFlow' == packagedata.documents[i].documentID) {
            docId = packagedata.documents[i].documentID;
          description = packagedata.documents[i].data['Description'];
          price = packagedata.documents[i].data['Price'];
          trainee = packagedata.documents[i].data['Trainee Name'];

          break;
        }
      }

      return Scaffold(
        body: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 50.0, top: 50.0, right: 60),
                      child: Text(
                        'Edit Your Package',
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
                  _buildDescTF(),
                  SizedBox(height: 30.0),
                  _buildPriceTF(),
                  SizedBox(height: 30.0),
                  _buildTraineeTF(),
                  SizedBox(height: 30.0),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 150),
                    child: Row(
                      children: <Widget>[
                        RaisedButton(
                          color: Colors.blue,
                          child: Text("Submit"),
                          onPressed: () {
                            fobj.updatePkgData({
                                'Description': this.description,
                                'Price': this.price,
                                'Trainee Name': this.trainee,
                            }, docId).then((result) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dashboard()));
                              _adddialog(context);
                            }).catchError((e) {
                              print(e);
                            });
                            fobj.getpersonaldata().then((results) {
                              setState(() {
                                  packagedata = results;
                              });
                            });
                          },
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ),
      );
    }
    else{
        return  Scaffold(
            body: Center(
                child: LoadingBouncingGrid.circle(
                    size: 30,
                    backgroundColor: Colors.blue,
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
                  title: Text("Package data Updated successfully", style: TextStyle(fontSize: 15.0)),
                  actions: <Widget>[
                      FlatButton(
                          child: Text("OK",),
                          textColor: Colors.blue,
                          onPressed: () {
                              Navigator.of(context).pop();
                          },
                      )
                  ],
              );
          },
      );
  }

  Widget _buildDescTF() {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
              Text(
                  "Description",
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
                          hintText: '$description',
                          hintStyle: kHintTextStyle,
                      ),
                      onChanged: (input) => this.description = input,
                  ),
              ),
          ],
      );
  }

  Widget _buildPriceTF() {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
              Text(
                  "Price",
                  style: kLabelStyle,
              ),
              SizedBox(height: 5.0),
              Container(
                  alignment: Alignment.centerLeft,
                  decoration: kBoxDecorationStyle,
                  margin: EdgeInsets.symmetric(vertical: 5),
                  height: 60,
                  width: 330,
                  child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(15.0),
                          hintText: '$price',
                          hintStyle: kHintTextStyle,
                      ),
                      onChanged: (input) => this.price = input,
                  ),
              ),

          ],
      );
  }

  Widget _buildTraineeTF() {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
              Text(
                  "Trainee Name",
                  style: kLabelStyle,
              ),
              SizedBox(height: 5.0),
              Container(
                  alignment: Alignment.centerLeft,
                  decoration: kBoxDecorationStyle,
                  margin: EdgeInsets.symmetric(vertical: 5),
                  height: 60,
                  width: 330,
                  child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(15.0),
                          hintText: '$trainee',
                          hintStyle: kHintTextStyle,
                      ),
                      onChanged: (input) => this.trainee = input,
                  ),
              ),

          ],
      );
  }

}
