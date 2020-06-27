import 'package:exerholic/Screens/SelectPlan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_chip_select/flutter_multi_chip_select.dart';
import 'MyAppBar.dart';

class AddWorkout extends StatefulWidget {
  @override
  _AddWorkoutState createState() => _AddWorkoutState();
}

class _AddWorkoutState extends State<AddWorkout> {
  String workout="";
  final multiSelectKey = GlobalKey<MultiSelectDropdownState>();
  var menuItems = ["Zumba","Strong by Zumba","Yoga","Power Yoga","Functional Training","HIIT","Animal Flow","Step Aerobics","Bolly Achive"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: MyAppBar(),
        preferredSize: Size.fromHeight(60.0),
      ),
      backgroundColor: Colors.white,
      body:  Column(
          children: <Widget>[
            SizedBox(height: 30,),
            Padding(
              padding: EdgeInsets.only(
                  left: 20.0, right: 5.0, top: 5.0),
            ),
            Flexible(
              child: Container(
                child: Text("Customize workout as per your need.\nAdd atleast two workouts from dropdown",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              ),
            ),
            SizedBox(height: 30,),
            Container(
              margin: EdgeInsets.all(10),
              child: FlutterMultiChipSelect(
                key: multiSelectKey,
                elements: List.generate(
                  menuItems.length,
                      (index) => MultiSelectItem<String>.simple(
                      title: "${menuItems[index]}",
                      value: "${menuItems[index]}"),
                ),
                label: "Add Workout",
                values: [],
              ),
            ),
            SizedBox(height: 350,),
            RaisedButton(
              child: Text("Checkout",style: TextStyle(color: Colors.white),),
              color: Colors.pink,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              onPressed: () {
                setState(() {
                  workout =
                      this.multiSelectKey.currentState.result.toString();
                  if(workout.split(",").length>=2)
                    {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>SelectPlan(workout)));
                    }
                  else{
                       _addDialog(context);
                  }
                });
              },
            ),
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
            title: Center(child: Text("Select Atleast Two Workout", style: new TextStyle(color: Colors.white ),)),
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
