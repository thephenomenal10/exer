import 'package:exerholic/Screens/Diet.dart';
import 'package:flutter/material.dart';
import './Screens/Home.dart';
import './Screens/Packages.dart';
import './Screens/Diet.dart';
import './Screens/Reschedule.dart';
import './Screens/MorePage.dart';



final tabs = [
  Center(child: Home()),
  Center(child: Packages()),
  Center(child: Diet()),
  Center(child: Reschedule()),
  Center(child: More()),
];