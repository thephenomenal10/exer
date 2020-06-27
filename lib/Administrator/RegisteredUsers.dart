import 'package:exerholic/Screens/MyAppBar.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../services.dart';


class RegisteredUsers extends StatefulWidget{
    @override
    State<StatefulWidget> createState() {
        // TODO: implement createState
        return RegisteredUsersState();
    }

}

class RegisteredUsersState extends State<RegisteredUsers>{

    service fobj=new service();
    QuerySnapshot personaldata;

    Map<String, dynamic> temp ;

    @override
    void initState() {

        // TODO: implement initState
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
        // TODO: implement build
        if(personaldata!=null) {
            return new Scaffold(
                    appBar: PreferredSize(
                        child: MyAppBar(),
                        preferredSize: Size.fromHeight(60.0),
                    ),

                    body: new ListView(
                        children: <Widget>[
                            SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Column(
                                    children: <Widget>[
                                        Padding(padding: EdgeInsets.only(top:20.0)),
                                        Container(
                                            margin: EdgeInsets.only(right: 1000.0,left: 10.0),
                                            child: new Text("Registered Users", style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),),
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(top: 15.0, right: MediaQuery.of(context).size.width),
                                            child: new DataTable(
                                                columns: [
                                                    DataColumn(label: Text('Name', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),)),
                                                    DataColumn(label: Text('Phone', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),)),
                                                    DataColumn(label: Text('Gender', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),)),
                                                    DataColumn(label: Text('Weight', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),)),
                                                    DataColumn(label: Text('DOB', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),)),
                                                    DataColumn(label: Text('Height', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),)),
                                                    DataColumn(label: Text('Workout', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),)),

                                                ],

                                                rows: List.generate(
                                                    personaldata.documents.length,(index)=>_getDataRow(index),
                                                )
                                            ),
                                        ),
                                    ],

                                ),
                            ),

                        ],
                    ),
                );
        }
        return
            Container(
                color: Colors.white,
                child: Center(
                    child: Column(children: [
                        Container(
                            margin: EdgeInsets.only(top:350),
                            child: CircularProgressIndicator(),
                        ),

                    ]),
                ),
            );
    }


    DataRow _getDataRow(int i) {


        return DataRow(
            cells: <DataCell>[
                DataCell(Text("${personaldata.documents[i].data['Name']}")),
                DataCell(Text("${personaldata.documents[i].data['Phone']}")),
                DataCell(Text("${personaldata.documents[i].data['Gender']}")),
                DataCell(Text("${personaldata.documents[i].data['Weight']}")),
                DataCell(Text("${personaldata.documents[i].data['DOB']}")),
                DataCell(Text("${personaldata.documents[i].data['Height']}")),
                DataCell(Text("${personaldata.documents[i].data['Workout']}")),
            ],
        );
    }

}