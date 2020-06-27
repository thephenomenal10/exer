import 'package:flutter/material.dart';
import 'package:exerholic/Authentication/IsUserLoggedIn.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'roman',
        primaryColor: Colors.pink
      ),
      title: "Exerholic",
      home:  IsUserLoggedIn(),
    ),
  );
}


