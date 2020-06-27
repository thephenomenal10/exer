import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exerholic/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:exerholic/Widgets/globalVariable.dart' as global;

import '../constants.dart';

class Reschedule extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RescheduleState();
  }
}

class RescheduleState extends State<Reschedule> {
  service fobj = new service();

  String reason = 'Provide Reason', package = null, month;
  String amount;
  FirebaseUser user;
  QuerySnapshot bookdata;
  DateTime presentdate = DateTime.now();

  Future<void> getUserData() async {
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();
    setState(() {
      user = userData;
    });
  }

  void initState() {
    fobj.getbookingdata().then((results) {
      setState(() {
        bookdata = results;
      });
    });
    getUserData();
    // TODO: implement initState
    super.initState();
  }

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  final format = DateFormat("yyyy-MM-dd");
  DateTime bookdate = null;
  String bookdate1;

  TextEditingController _reasonController = new TextEditingController();
  TextEditingController _dateController = new TextEditingController();
  int j = -1;
  var time, date, newDate;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (global.isGuest == true) {
      return Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 3),
              Center(
                child: LoadingBouncingGrid.circle(
                  size: 30,
                  backgroundColor: Colors.pink,
                ),
              ),
              SizedBox(height: 30.0),
              Container(
                  child: new Text(" You are not logged in please login ",
                      style: new TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 15))),
            ],
          ),
        ),
      );
    } else {
      if (bookdata != null) {
        return _bookData();
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
  }

  _bookData() {
    if (bookdata != null) {
      for (int i = 0; i < bookdata.documents.length; i++) {
        if (user.email == bookdata.documents[i].documentID) {
          reason = bookdata.documents[i].data['Reason'];
          bookdate1 = bookdata.documents[i].data['Date'];
          amount = bookdata.documents[i].data['Amount'];
          package = bookdata.documents[i].data['Packages'];
          month = bookdata.documents[i].data['Month'];
          j = i;
          time = DateTime.parse(bookdate1);
          int month1 = int.parse(month);
          date = new DateTime(time.year, time.month, time.day);
          newDate = new DateTime(date.year, date.month + month1, date.day);
          break;
        }
      }
      if (j >= 0) {
        if ((newDate.year > presentdate.year) ||
            (newDate.year == presentdate.year &&
                newDate.month > presentdate.month) ||
            (newDate.year == presentdate.year &&
                newDate.month == presentdate.month &&
                newDate.day >= presentdate.day)) {
          return new Scaffold(
            body: new ListView(
              children: <Widget>[
                Container(
                  child: new Form(
                    key: _key,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 50.0, top: 30.0, right: 60),
                            child: Text(
                              'Reschedule',
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
                          margin: EdgeInsets.only(top: 40, right: 100),
                          child: Text(
                            "Enter Reason for rescheduling",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: kBoxDecorationStyle,
                          margin: EdgeInsets.only(top: 10, bottom: 5),
                          height: 100,
                          width: 330,
                          child: TextFormField(
                            maxLines: 10,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(5.0),
                              hintText: '$reason',
                              hintStyle: kHintTextStyle,
                            ),
                            controller: _reasonController,
                            onChanged: (result) {
                              this.reason = result;
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20, right: 210),
                          child: Text(
                            "Pick new date",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          height: 60,
                          width: 330,
                          decoration: kBoxDecorationStyle,
                          child: DateTimeField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(15.0),
                              hintText: '$bookdate1',
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
                            onChanged: (value) {
                              this.bookdate = value;
                            },
                            controller: _dateController,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 150),
                          child: Row(
                            children: <Widget>[
                              RaisedButton(
                                color: Colors.pink,
                                child: Text("Submit"),
                                onPressed: () {
                                  fobj
                                      .addBookingData({
                                        'Amount': this.amount,
                                        'Date': _dateController.text,
                                        'Reason': _reasonController.text,
                                        'Packages': this.package,
                                        'Month': this.month
                                      }, user.email)
                                      .then((result) {})
                                      .catchError((e) {
                                        print(e);
                                      });
                                  fobj.getbookingdata().then((results) {
                                    setState(() {
                                      bookdata = results;
                                    });
                                  });
                                  _addDialog(context);
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          print("inside 1");
          _delete();
          return Scaffold(
              body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                    "You don't booked any package or your package has expired."),
                Text("Please book a package.")
              ],
            ),
          ));
        }
      } else {
        return Scaffold(
            body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("You don't booked any package or your package has expired."),
              Text("Please book a package.")
            ],
          ),
        ));
      }
    }
  }

  Future<dynamic> _addDialog(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: Text("Rescheduled successfully")),
            content: SingleChildScrollView(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 70),
                    child: Center(
                      child: RaisedButton(
                        color: Colors.pink,
                        child: Text(
                          "ok",
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  _delete() {
    Firestore.instance
        .collection('Booking Data')
        .document('${user.email}')
        .delete()
        .catchError((e) {
      print(e);
    });
  }
}
