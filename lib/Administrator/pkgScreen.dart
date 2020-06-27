import 'package:exerholic/Administrator/UpdatePkgs/updateAnimalFlow.dart';
import 'package:exerholic/Administrator/UpdatePkgs/updateBollyActive.dart';
import 'package:exerholic/Administrator/UpdatePkgs/updateFunctionalTraining.dart';
import 'package:exerholic/Administrator/UpdatePkgs/updateHiit.dart';
import 'package:exerholic/Administrator/UpdatePkgs/updatePowerYoga.dart';
import 'package:exerholic/Administrator/UpdatePkgs/updateStepAerobics.dart';
import 'package:exerholic/Administrator/UpdatePkgs/updateStrongByZumba.dart';
import 'package:exerholic/Administrator/UpdatePkgs/updateZumba.dart';
import 'package:exerholic/Screens/MyAppBar.dart';
import 'package:exerholic/Widgets/widget.dart';
import 'package:flutter/material.dart';


class Pkg extends StatefulWidget {
  @override
  _PkgState createState() => _PkgState();
}

class _PkgState extends State<Pkg> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(
        child: MyAppBar(),
        preferredSize: Size.fromHeight(60.0),
      ),
      body: new Container(
        child: packages(
            context: context,
            zumba: UpdateZumba(),
            strongByZumba: UpdateStrongByZumba(),
            powerYoga: UpdatePowerYoga(),
            functionalTraining: UpdateFunctionalTraining(),
            stepAerobics: UpdateStepAerobics(),
            animalFlow: UpdateAnimalFlow(),
            bollyActive: UpdateBollyActive(),
            hiit: UpdateHiit()
        ),
      ),
    );
  }
}

