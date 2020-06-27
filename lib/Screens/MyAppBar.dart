import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:exerholic/Authentication/SignPage.dart';

class MyAppBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppBarState();
  }
}

class MyAppBarState extends State<MyAppBar> {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return new AppBar(
      leading: Container(
          margin: EdgeInsets.only(left: 10.0),
          child: Image(
            image: AssetImage("assets/logo.png"),
            height: 20.0,
            width: 10.0,
          )),
      title: new Text(
        "EXERHOLIC",
        style: new TextStyle(color: (Colors.pink), fontSize: 30.0, fontWeight: FontWeight.w600),
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 4.0,
      actions: <Widget>[
        Row(
          children: [
            new Text("Logout", style: new TextStyle(color: Colors.pink),),
            new IconButton(
                icon: new Icon(
                  Icons.exit_to_app,
                  color: Colors.pink,
                  size: 35,
                  textDirection: TextDirection.rtl,
                ),
                onPressed: signOut),
          ],
        )
      ],
    );
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut().then((value) =>
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignInPage())));
  }
}
