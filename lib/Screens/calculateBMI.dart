import 'package:exerholic/constants.dart';
import 'package:flutter/material.dart';

class CalculateBMI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CalculateBMIState();
  }
}

class CalculateBMIState extends State<CalculateBMI> {
  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  double result = 0.0;
  String _resultReading = "";
  String _finalResult = "";

  void __calculateBMI() {
    setState(() {
      int age = int.parse(_ageController.text);
      double weight = double.parse(_weightController.text);
      double height = double.parse(_heightController.text);
      if ((_ageController.text.isNotEmpty || age > 0) &&
          ((_heightController.text.isNotEmpty || height > 0) &&
              (_weightController.text.isNotEmpty || weight > 0))) {
        result = ((weight) / (height * height)) * 10000;

        if (double.parse(result.toStringAsFixed(1)) < 18.5) {
          _resultReading = "UNDERWEIGHT";
        } else if (double.parse(result.toStringAsFixed(1)) >= 18.5 &&
            result < 24.5) {
          _resultReading = "NORMAL WEIGHT";
        } else if (double.parse(result.toStringAsFixed(1)) >= 25 &&
            result < 29.9) {
          _resultReading = "OVERWEIGHT";
        } else if (double.parse(result.toStringAsFixed(1)) >= 30.0) {
          _resultReading = "OBESITY";
        }
      } else {
        result = 0.0;
      }
    });
    _finalResult = "Your BMI: ${result.toStringAsFixed(1)}";
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          "BMI",
          style: new TextStyle(
            color: Colors.white,
            fontSize: 25.0,
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade400,
      body: new Container(
        alignment: Alignment.topCenter,
        margin: new EdgeInsets.all(30.0),
        color: Colors.white,
        child: new ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: 'Age',
                    hintText: 'in years',
                    isDense: true,
                  ),
                ),
                new TextField(
                  controller: _heightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    icon: Icon(Icons.assessment),
                    labelText: 'Height',
                    hintText: 'in centimeters',
                    isDense: true,
                  ),
                ),
                new TextField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    icon: Icon(Icons.line_weight),
                    labelText: 'Weight',
                    hintText: 'in KG',
                    isDense: true,
                  ),
                ),
                new Container(
                  margin: EdgeInsets.all(40.0),
                  child: new RaisedButton(
                    onPressed: __calculateBMI,
                    color: Colors.black,
                    child: new Text(
                      "Calculate",
                      style: new TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                new Container(
                  child: Center(
                    child: new Text(
                      "$_finalResult",
                      style: new TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                new Padding(padding: new EdgeInsets.all(7.0)),
                new Container(
                  child: new Center(
                    child: new Text(
                      "$_resultReading",
                      style: new TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
