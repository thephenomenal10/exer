import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:exerholic/Widgets/dialogBox.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loading_animations/loading_animations.dart';
import '../services.dart';
import 'package:exerholic/homePage.dart';

import '../constants.dart';
import 'MyAppBar.dart';


class BookSlot extends StatefulWidget {
  final String workout;
  final double amount;
  BookSlot(this.workout,this.amount);



  @override
  _BookSlotState createState() => _BookSlotState();
}

class _BookSlotState extends State<BookSlot> {

  service obj = new service();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user = null;

  TextEditingController _dateController = new TextEditingController();

  final format = DateFormat("yyyy-MM-dd");

  DateTime now = DateTime.now();
  String formattedDate ;
  int month;
  DateTime bookdate = null;

  String reason="";
  QuerySnapshot personaldata;
  Future<void> getUserData() async {
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();
    setState(() {
      user = userData;
      print(userData);
      print("user is ${user.email}");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    formattedDate= DateFormat('yyyy-MM-dd').format(now);
    getUserData();
    if(widget.amount==1200)
      month=1;
    else if(widget.amount==3200)
      month=3;
    else if(widget.amount==6000)
      month=6;
    else if(widget.amount==10000)
      month=12;


  }


  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String workout=widget.workout.replaceAll("[",'');
    workout=workout.replaceAll("]", '');
    List<String>workout1=workout.split(',');

     return Scaffold(
      appBar: PreferredSize(
        child: MyAppBar(),
        preferredSize: Size.fromHeight(60.0),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  margin:EdgeInsets.only(top: 20),
                  child: Text("Thank you for choosing ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
              Container(
                  margin: EdgeInsets.only(left: 110,top: 10),
                  height: double.parse("${widget.workout.split(",").length}")*30,
                  child: ListView.builder(
                      itemCount:widget.workout.split(",").length,
                      itemBuilder:(BuildContext ctxt, int index) {
                        return new Text("${index+1} : ${workout1[index]}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),);
                      }
                  )
              ),
              Container(

                  child: Text("Your Payment of ${widget.amount} is successfull.",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
              Container(
                margin:EdgeInsets.only(top:20,left: 10,right: 10),
                child: Text("Now please book a slot,slot booking is only available for 48 hours.",style: TextStyle(fontSize: 18),),
              ),
              Form(
                key: _key,
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  height: 60,
                  width: 330,
                  decoration: kBoxDecorationStyle,
                  child: DateTimeField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15.0),
                      hintText: 'Pick your date',
                      hintStyle: kHintTextStyle1,
                    ),
                    format: format,
                    onShowPicker: (context, currentValue) {
                      return showDatePicker(
                          context: context,
                          firstDate: DateTime(2019),
                          initialDate: currentValue ?? DateTime.now(),
                          lastDate: DateTime(2021));
                    },
                    onChanged: (value){
                      this.bookdate=value;
                    },
                    controller: _dateController,
                  ),
                ),
              ),
              SizedBox(height: 50,),
              RaisedButton(

                child: Text("Book Slot",style: TextStyle(color: Colors.white),),
                color: Colors.pink,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () {


                      savingData();


                },
              ),
            ],
          )
        ],
      ),
    );


  }
  Future<dynamic>_addDialog(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: Text("Select Date")),
            content: SingleChildScrollView(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left:70),
                    child: Center(
                      child: RaisedButton(
                        color: Colors.pink,
                        child: Text("ok",style: TextStyle(fontSize: 20,color: Colors.white),),
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

  void savingData()async {
    print(_dateController.text=='');
    if(_dateController.text!='') {
      if (_key.currentState.validate()) {
        _key.currentState.save();
        try {
          obj.addBookingData({
            'Date': _dateController.text,
            'Amount': "${widget.amount}",
            'Packages': widget.workout,
            'Reason': this.reason,
            'Month': "${this.month}",
          }, user.email).then((result) {
            alertDialog(
              context, 
              "You have succefully booked your package", 
              HomePage()
              );
          }).catchError((e) {
            print(e);
          });
        }
        catch (e) {
          return (e.message);
        }
      }
    }else{
      _addDialog(context);
    }


  }
}