import 'package:exerholic/Screens/MyAppBar.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services.dart';



class BookingData extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BookingDataState();
  }

}

class BookingDataState extends State<BookingData>{

  service fobj=new service();
  QuerySnapshot bookingdata;

  Map<String, dynamic> temp ;

  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    fobj.getbookingdata().then((results) {
      setState(() {
        bookingdata = results;
      });
    });
  }


  final List<Map<String, String>> listcol = [
    {"Name": "BBBBBB", "Number": "2", "State": "no"},
  ];
  int i;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(bookingdata!=null) {
      return new WillPopScope(
//        onWillPop: _onWillPop,
        child: Scaffold(
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
                    Padding(padding: EdgeInsets.only(top: 20.0)),
                    Container(
                      margin: EdgeInsets.only(right: 200.0),
                      child: new Text("Booking data", style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15.0),
                      child: new DataTable(
                          columns: [
                            DataColumn(label: Text('Amount', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),)),
                            DataColumn(label: Text('Date', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0))),
                            DataColumn(label: Text('Packages', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0))),
                          ],

                          rows: List.generate(
                            bookingdata.documents.length,(index)=>_getDataRow(index),
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
        DataCell(Text("${bookingdata.documents[i].data['Amount']}")),
        DataCell(Text("${bookingdata.documents[i].data['Date']}")),
        DataCell(Text("${bookingdata.documents[i].data['Packages']}")),
      ],
    );
  }

}