
  import 'package:cloud_firestore/cloud_firestore.dart';
  import 'package:exerholic/Screens/BookSlot.dart';
  import 'package:exerholic/Screens/ProceedToPayment.dart';
  import 'package:firebase_auth/firebase_auth.dart';
  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter/painting.dart';
  import 'package:loading_animations/loading_animations.dart';

  import '../services.dart';


  class SelectPlan extends StatefulWidget {
    final String workout;

    SelectPlan(this.workout);


    @override
    _SelectPlanState createState() => _SelectPlanState();
  }

  class _SelectPlanState extends State<SelectPlan> {
    double _result = 1200;
    int _radioValue = 0;
    FirebaseUser user;
    service fobj = new service();
    QuerySnapshot personaldata;

    void _handleRadioValueChange(int value) {
      setState(() {
        _radioValue = value;

        switch (_radioValue) {
          case 0:
            _result = 1200;
            break;
          case 1:
            _result = 3200;
            break;
          case 2:
            _result = 6000;
            break;
          case 3:
            _result = 10000;
            break;
        }
      });
    }
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
      super.initState();
    }


    @override
    Widget build(BuildContext context) {
      double width = MediaQuery.of(context).size.width;
      double height = MediaQuery.of(context).size.height;
      String workout=widget.workout.replaceAll("[",'');
      workout=workout.replaceAll("]", '');
      List<String>workout1=workout.split(',');
      if(personaldata!=null) {
        return Scaffold(
        appBar: new AppBar(
          title: new Text("Exerholic",
            style: new TextStyle(
                color: (Colors.pink)
            ),
          ),
          backgroundColor: Colors.white,
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.exit_to_app,color: Colors.red,size: 40, textDirection: TextDirection.rtl,), onPressed: null, )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[

              Container(
                  margin:EdgeInsets.only(top: 20),
                  child: Text("Thank you for choosing ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
              Container(
                  margin: EdgeInsets.only(left: 110,top: 10),
                  height: double.parse("${widget.workout.split(",").length}")*20,
                  child: ListView.builder(
                      itemCount:widget.workout.split(",").length,
                      itemBuilder:(BuildContext ctxt, int index) {
                        return new Text("${index+1} : ${workout1[index]}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),);
                      }
                  )
              ),
              Container(
                  child: Text("CURRENT SCHEDULE",style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,decoration:TextDecoration.underline),textAlign: TextAlign.center,)),
              Container(
                margin: EdgeInsets.all(10),
                child: Table(
                  border: TableBorder.all(),
                  children: [
                    TableRow( children: [
                      Container(
                        height: 50,
                        width: 50,
                        color: Colors.blue,
                        child: Column(children:[
                          Padding(
                            padding: EdgeInsets.all(5),
                          ),
                          Text('',style: TextStyle(fontSize: 20),)
                        ]),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        color: Colors.blue,
                        child: Column(children:[
                          Padding(
                            padding: EdgeInsets.all(5),
                          ),
                          Text('Mon',style: TextStyle(fontSize: 20),)
                        ]),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        color: Colors.blue,
                        child: Column(children:[
                          Padding(
                            padding: EdgeInsets.all(5),
                          ),
                          Text('Tue',style: TextStyle(fontSize: 20),)
                        ]),
                      ),

                      Container(
                        height: 50,
                        width: 50,
                        color: Colors.blue,
                        child: Column(children:[
                          Padding(
                            padding: EdgeInsets.all(5),
                          ),
                          Text('Wed',style: TextStyle(fontSize: 20),)
                        ]),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        color: Colors.blue,
                        child: Column(children:[
                          Padding(
                            padding: EdgeInsets.all(5),
                          ),
                          Text('Thur',style: TextStyle(fontSize: 20),)
                        ]),
                      ),
                      Container(
                        height: 50,
                        width:50,
                        color: Colors.blue,
                        child: Column(children:[
                          Padding(
                            padding: EdgeInsets.all(5),
                          ),
                          Text('Fri',style: TextStyle(fontSize: 20),)
                        ]),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        color: Colors.blue,
                        child: Column(children:[
                          Padding(
                            padding: EdgeInsets.all(5),
                          ),
                          Text('Sat',style: TextStyle(fontSize: 20),)
                        ]),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        color: Colors.blue,
                        child: Column(children:[
                          Padding(
                            padding: EdgeInsets.all(5),
                          ),
                          Text('Sun',style: TextStyle(fontSize: 20),)
                        ]),
                      ),
                    ]),
                    TableRow( children: [
                      Container(
                        height: 50,
                        width: 50,
                        color: Colors.blue,
                        child: Column(children:[
                          Padding(
                            padding: EdgeInsets.all(8),
                          ),
                          Text('    MORNING   \n 7:15 -8:15AM',style: TextStyle(fontSize:7,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,decoration:TextDecoration.underline))
                        ]),
                      ),
                      Column(children:[

                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fzumba.png?alt=media&token=f329e4f7-8e9a-4c96-8572-3c51be819f9d"),
                                fit: BoxFit.fitHeight,
                                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop)
                            ),

                          ),
                        ),

                      ]),
                      Column(children:[

                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fyoga.png?alt=media&token=59187ade-1363-4de0-8d76-cc16d48d1d1a"),
                                fit: BoxFit.fitHeight,
                                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop)
                            ),

                          ),
                        ),

                      ]),
                      Column(children:[

                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fstrong_by_zumba.png?alt=media&token=ae605460-fc82-4b34-975f-ebd66b0a4fa1"),
                                fit: BoxFit.fitHeight,
                                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop)
                            ),

                          ),
                        ),

                      ]),
                      Column(children:[

                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Ffunctional_training.png?alt=media&token=225e8810-29ce-40ad-9fb5-4d4baf5291ca"),
                                fit: BoxFit.fitHeight,
                                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop)
                            ),

                          ),
                        ),

                      ]),
                      Column(children:[

                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fstep_aerobics.png?alt=media&token=eb842860-7db2-44d8-a442-a4101e2a70c2"),
                                fit: BoxFit.fitHeight,
                                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop)
                            ),

                          ),
                        ),

                      ]),
                      Column(children:[

                        Container(
                          height: 50,
                          width: 45,
                          color: Colors.black,
                        ),

                      ]),
                      Column(children:[


                        Container(
                          height: 50,
                          width: 45,
                          color: Colors.black,
                        ),

                      ]),
                    ]),
                    TableRow( children: [
                      Container(
                        height: 50,
                        width: 50,
                        color: Colors.blue,
                        child: Column(children:[
                          Padding(
                            padding: EdgeInsets.all(8),
                          ),

                          Text('    NOON \n 11 - 12PM',style: TextStyle(fontSize:7,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,decoration:TextDecoration.underline))
                        ]),
                      ),
                      Column(children:[

                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fpower_yoga.png?alt=media&token=468164a1-e941-40f6-9cbf-bc90a37067d7"),
                                fit: BoxFit.fitHeight,
                                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop)
                            ),

                          ),
                        ),

                      ]),
                      Column(children:[

                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fstrong_by_zumba.png?alt=media&token=ae605460-fc82-4b34-975f-ebd66b0a4fa1"),
                                fit: BoxFit.fitHeight,
                                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop)
                            ),

                          ),
                        ),

                      ]),
                      Column(children:[

                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Ffunctional_training.png?alt=media&token=225e8810-29ce-40ad-9fb5-4d4baf5291ca"),
                                fit: BoxFit.fitHeight,
                                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop)
                            ),

                          ),
                        ),

                      ]),
                      Column(children:[

                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fzumba.png?alt=media&token=f329e4f7-8e9a-4c96-8572-3c51be819f9d"),
                                fit: BoxFit.fitHeight,
                                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop)
                            ),

                          ),
                        ),

                      ]),
                      Column(children:[

                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fyoga.png?alt=media&token=59187ade-1363-4de0-8d76-cc16d48d1d1a"),
                                fit: BoxFit.fitHeight,
                                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop)
                            ),

                          ),
                        ),

                      ]),
                      Column(children:[

                        Container(
                          height: 50,
                          width: 45,
                          color: Colors.black,
                        ),

                      ]),
                      Column(children:[


                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fhiit.png?alt=media&token=c70acc8d-5e6f-4910-a080-21b67d174ade"),
                                fit: BoxFit.fitHeight,
                                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop)
                            ),

                          ),
                        ),

                      ]),
                    ]),
                    TableRow( children: [
                      Container(
                        height: 50,
                        width: 50,
                        color: Colors.blue,
                        child: Column(children:[
                          Padding(
                            padding: EdgeInsets.all(8),
                          ),
                          Text('    EVENING \n5:30 - 6:30PM',style: TextStyle(fontSize:7,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,decoration:TextDecoration.underline))
                        ]),
                      ),
                      Column(children:[

                        Container(
                          height: 50,
                          width: 45,
                          color: Colors.black,
                        ),

                      ]),
                      Column(children:[

                        Container(
                          height: 50,
                          width: 45,
                          color: Colors.black,
                        ),

                      ]),
                      Column(children:[

                        Container(
                          height: 50,
                          width: 45,
                          color: Colors.black,
                        ),
                      ]),
                      Column(children:[
                        Container(
                          height: 50,
                          width: 45,
                          color: Colors.black,
                        ),

                      ]),
                      Column(children:[
                        Container(
                          height: 50,
                          width: 45,
                          color: Colors.black,
                        ),
                      ]),
                      Column(children:[

                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fbolly_active.png?alt=media&token=26855845-1b88-49ec-8f02-3dd2c6efc8fc"),
                                fit: BoxFit.fitHeight,
                                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop)
                            ),

                          ),
                        ),

                      ]),
                      Column(children:[

                        Container(
                          height: 50,
                          width: 45,
                          color: Colors.black,
                        ),


                      ]),
                    ]),
                    TableRow( children: [
                      Container(
                        height: 50,
                        width: 50,
                        color: Colors.blue,
                        child: Column(children:[
                          Padding(
                            padding: EdgeInsets.all(8),
                          ),
                          Text('LATE EVENING \n 6:30 - 7:30PM',style: TextStyle(fontSize:7,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,decoration:TextDecoration.underline))
                        ]),
                      ),
                      Column(children:[

                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fstep_aerobics.png?alt=media&token=eb842860-7db2-44d8-a442-a4101e2a70c2"),
                                fit: BoxFit.fitHeight,
                                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop)
                            ),

                          ),
                        ),

                      ]),
                      Column(children:[

                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fhiit.png?alt=media&token=c70acc8d-5e6f-4910-a080-21b67d174ade"),
                                fit: BoxFit.fitHeight,
                                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop)
                            ),

                          ),
                        ),

                      ]),
                      Column(children:[

                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fyoga.png?alt=media&token=59187ade-1363-4de0-8d76-cc16d48d1d1a"),
                                fit: BoxFit.fitHeight,
                                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop)
                            ),

                          ),
                        ),

                      ]),
                      Column(children:[

                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fanimal_flow.png?alt=media&token=4848a895-037a-423f-bbab-9f9f643ad06c"),
                                fit: BoxFit.fitHeight,
                                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop)
                            ),

                          ),
                        ),

                      ]),
                      Column(children:[

                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fstrong_by_zumba.png?alt=media&token=ae605460-fc82-4b34-975f-ebd66b0a4fa1"),
                                fit: BoxFit.fitHeight,
                                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop)
                            ),

                          ),
                        ),

                      ]),
                      Column(children:[

                        Container(
                          height: 50,
                          width: 45,
                          color: Colors.green,
                        ),

                      ]),
                      Column(children:[

                        Container(
                          height: 50,
                          width: 45,
                          color: Colors.green,
                        ),

                      ]),
                    ]),
                    TableRow( children: [
                      Container(
                        height: 50,
                        width: 50,
                        color: Colors.blue,
                        child: Column(children:[
                          Padding(
                            padding: EdgeInsets.all(8),
                          ),
                          Text('LATE EVENING \n 7:30 - 8:30PM',style: TextStyle(fontSize:7,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,decoration:TextDecoration.underline))
                        ]),
                      ),
                      Column(children:[

                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fyoga.png?alt=media&token=59187ade-1363-4de0-8d76-cc16d48d1d1a"),
                                fit: BoxFit.fitHeight,
                                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop)
                            ),

                          ),
                        ),

                      ]),
                      Column(children:[

                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fzumba.png?alt=media&token=f329e4f7-8e9a-4c96-8572-3c51be819f9d"),
                                fit: BoxFit.fitHeight,
                                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop)
                            ),

                          ),
                        ),

                      ]),
                      Column(children:[

                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fbolly_active.png?alt=media&token=26855845-1b88-49ec-8f02-3dd2c6efc8fc"),
                                fit: BoxFit.fitHeight,
                                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop)
                            ),

                          ),
                        ),

                      ]),
                      Column(children:[

                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Ffunctional_training.png?alt=media&token=225e8810-29ce-40ad-9fb5-4d4baf5291ca"),
                                fit: BoxFit.fitHeight,
                                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop)
                            ),

                          ),
                        ),

                      ]),
                      Column(children:[

                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fanimal_flow.png?alt=media&token=4848a895-037a-423f-bbab-9f9f643ad06c"),
                                fit: BoxFit.fitHeight,
                                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop)
                            ),

                          ),
                        ),

                      ]),

                      Column(children:[
                        Container(
                            height: 50,
                            width: 50,
                            color: Colors.black,
                            child: Text("NOTE : Classes are    change  availability",style: TextStyle(color: Colors.white,fontSize: 8,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,decoration:TextDecoration.underline),)
                        )

                      ]),
                      Column(children:[
                        Container(
                            height: 50,
                            width: 50,
                            color: Colors.black,
                            child: Text("\nsubjected to   according to of faculty.",style: TextStyle(color: Colors.white,fontSize: 8,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,decoration:TextDecoration.underline),)
                        )

                      ]),
                    ]),

                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 0,left: 20,right: 250,bottom: 5),
                child: Text("Plans :-",style: TextStyle(fontWeight: FontWeight.bold),),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(left: 20,right: width/2.5),
                  decoration: BoxDecoration(
                    color: Colors.white70,

                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          new Radio(
                            activeColor: Colors.black,
                            value: 0,
                            groupValue:  _radioValue,
                            onChanged:_handleRadioValueChange ,
                          ),
                          new Text(
                            '1 Month :- ₹1200',
                            style: new TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          new Radio(
                            activeColor: Colors.black,
                            value: 1,
                            groupValue: _radioValue,
                            onChanged: _handleRadioValueChange,
                          ),
                          new Text(
                            '3 Month :- ₹3200',
                            style: new TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          new Radio(
                            activeColor: Colors.black,
                            value: 2,
                            groupValue: _radioValue,
                            onChanged:_handleRadioValueChange,
                          ),
                          new Text(
                            '6 Month :- ₹6000',
                            style: new TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          new Radio(
                            activeColor: Colors.black,
                            value: 3,
                            groupValue: _radioValue,
                            onChanged:_handleRadioValueChange,
                          ),
                          new Text(
                            '12 Month :- ₹10000',
                            style: new TextStyle(fontSize: 16.0),
                          ),
                        ],
                      )


                    ],
                  ),
                ),
              ),
              RaisedButton(
                child: Text("Proceed to payment",style: TextStyle(color: Colors.white),),
                color: Colors.pink,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () {
                  int count=0;
              for(int i=0;i<personaldata.documents.length;i++){
                if(personaldata.documents[i].documentID==user.email&&personaldata.documents[i].data['Free Workout']=='1'){
                  count=1;
                  _addfreedialog(context,i);
                }
              }
              if(count==0){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>ProceedToPayment(_result,widget.workout)));
              }


                },
              ),
            ],
          ),
        ),
      );
      }
      else {
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
    Future<dynamic>_addfreedialog(BuildContext context,int i) async {
      return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Center(child: Text("You have a free workout")),
              content: SingleChildScrollView(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10),
                      child: RaisedButton(
                          color: Colors.pink,
                          child: Text("take trial",style: TextStyle(fontSize: 20,color: Colors.white),),
                          onPressed: () {
                            fobj.addPersonalData({
                              'Name':personaldata.documents[i].data['Name'],
                              'Weight': personaldata.documents[i].data['Weight'],
                              'Height': personaldata.documents[i].data['Height'],
                              'Workout': personaldata.documents[i].data['Workout'],
                              'Gender': personaldata.documents[i].data['Gender'],
                              'DOB': personaldata.documents[i].data['DOB'],
                              'Phone': personaldata.documents[i].data['Phone'],
                              'Free Workout': '0'
                            }, user.email).then((result) {}).catchError((e) {
                              print(e);
                            });
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>BookSlot(widget.workout,_result)));
                          }
                      ),

                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: RaisedButton(
                        color: Colors.pink,
                        child: Text("skip",style: TextStyle(fontSize: 20,color: Colors.white),),
                        onPressed: (){

                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>ProceedToPayment(_result,widget.workout)));
                        },
                      ),

                    ),

                  ],
                ),
              ),
            );

          }

      );
    }

  }