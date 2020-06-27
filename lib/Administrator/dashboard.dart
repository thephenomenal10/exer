import 'dart:io';
import 'package:exerholic/Administrator/BookingData.dart';
import 'package:exerholic/Administrator/RegisteredUsers.dart';
import 'package:exerholic/Administrator/pkgScreen.dart';
import 'package:exerholic/Screens/MyAppBar.dart';
import 'package:flutter/material.dart';


class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
      child: Scaffold(
        appBar: PreferredSize(
          child: MyAppBar(),
          preferredSize: Size.fromHeight(60.0),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
                SizedBox(
                    height: 30.0,
                ),
              new Container(
                  width: 250.0,
                child: new FloatingActionButton(
                    heroTag: "next1",
                    isExtended: true,
                    child: new Text("Registered Users", style: new TextStyle(fontSize: 18.0),),
                    elevation:8.0,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisteredUsers()));
                    }
                ),
              ),
                SizedBox(
                    height: 30.0,
                ),
              new Container(
                  width: 250.0,
                child: new FloatingActionButton(
                    heroTag: "next2",
                    isExtended: true,
                    child: new Text("Booking Data", style: new TextStyle(fontSize: 18.0),),
                    elevation:8.0,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BookingData()));
                    }
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              new Container(
                  width: 250.0,
                child: new FloatingActionButton(
                    heroTag: "next3",
                    isExtended: true,
                    child: new Text("Update Package", style: new TextStyle(fontSize: 18.0),),
                    elevation:8.0,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Pkg()));
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Future<bool> _onWillPop() {
      return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
              title: new Text('Are you sure?'),
              content: new Text('Do you want to exit an App'),
              actions: <Widget>[
                  new FlatButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: new Text('No'),
                  ),
                  new FlatButton(
                      onPressed: () => exit(0),
                      child: new Text('Yes'),
                  ),
              ],
          ),
      ) ??
          false;
  }
}
