import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import './../pkgDescription/AnimalFlow.dart';
import './../pkgDescription/BollyActive.dart';
import './../pkgDescription/FunctionalTraining.dart';
import './../pkgDescription/zumba.dart';
import './../pkgDescription/Hiit.dart';
import './../pkgDescription/PowerYoga.dart';
import './../pkgDescription/StepAerobics.dart';
import './../pkgDescription/StrongByZumba.dart';

import 'package:exerholic/Widgets/widget.dart';





class Packages extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PackagesState();
  }

}

class PackagesState extends State<Packages>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(
      body: Container(
        child: packages(
          context: context,
          zumba: Zumba(),
          strongByZumba: StrongByZumba(),
          powerYoga: PowerYoga(),
          functionalTraining: FunctionalTraining(),
          stepAerobics: StepAerobics(),
          animalFlow: AnimalFlow(),
          bollyActive: BollyActive(),
          hiit: Hiit()
        )
      )
    );

  }
}