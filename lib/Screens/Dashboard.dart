import 'package:exerholic/constants.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loading_animations/loading_animations.dart';

import '../services.dart';
import 'MyAppBar.dart';



class Dashboard extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DashboardState();
  }

}

class DashboardState extends State<Dashboard>{

service fobj=new service();
QuerySnapshot personaldata;

  Map<String, dynamic> temp ;

  @override
  void initState() {

    super.initState();
    fobj.getpersonaldata().then((results) {
      setState(() {
        personaldata = results;
      });
    });
  }


 int i;
  @override
  Widget build(BuildContext context) {
    if(personaldata!=null) {
        return new WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: PreferredSize(
          child: MyAppBar(),
          preferredSize: Size.fromHeight(60.0),
        ),
        body: new ListView(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                child: new DataTable(
                  columns: [
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Phone')),
                    DataColumn(label: Text('Gender')),
                    DataColumn(label: Text('Weight')),
                    DataColumn(label: Text('BMI')),
                    DataColumn(label: Text('DOB')),
                    DataColumn(label: Text('Height')),
                    DataColumn(label: Text('Workout')),

                  ],

                  rows: List.generate(
                    personaldata.documents.length,(index)=>_getDataRow(index),
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
    }else{
      return new WillPopScope(
        onWillPop: _onWillPop,
      child: Scaffold(
        body: Center(
          child: LoadingBouncingGrid.circle(
            size: 30,
            backgroundColor: Colors.pink,
          ),
        ),
      )
      );
    }
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
DataRow _getDataRow(int i) {


  return DataRow(
    cells: <DataCell>[
      DataCell(Text("${personaldata.documents[i].data['Name']}")),
      DataCell(Text("${personaldata.documents[i].data['Phone']}")),
      DataCell(Text("${personaldata.documents[i].data['Gender']}")),
      DataCell(Text("${personaldata.documents[i].data['Weight']}")),
      DataCell(Text("${personaldata.documents[i].data['BMI']}")),
      DataCell(Text("${personaldata.documents[i].data['DOB']}")),
      DataCell(Text("${personaldata.documents[i].data['Height']}")),
      DataCell(Text("${personaldata.documents[i].data['Workout']}")),
    ],
  );
}

}