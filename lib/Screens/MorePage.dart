import 'package:exerholic/Screens/PrivacyPolicy.dart';
import 'package:exerholic/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'HelpPage.dart';
import 'Profile.dart';

import 'package:social_media_buttons/social_media_buttons.dart';

class More extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    return MoreState();
  }

}

class MoreState extends State<More>{
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          Center(
            child: GestureDetector(
              child: Container(
                margin: EdgeInsets.only(top: 30.0),
                decoration: new BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(6.0),
                  boxShadow: [
                    BoxShadow(color: Colors.grey, offset: Offset(0.0, 4.0), blurRadius: 8.0)
                  ]
                ),
                width: 300.0,
                height: 50,
                  child: new Container(
                    child: Row(
                      children: <Widget>[
                         Icon(Icons.person, color: Colors.white, size: 40.0,),
                        Padding(padding: EdgeInsets.only(left: 40.0)),
                        new Text("Profile",style:  new TextStyle(color: Colors.white, fontSize: 25.0, letterSpacing: 2.0),),

                      ],
                    ),
                  ),
              ),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Profile())),
            ),
          ),

          Center(
            child: GestureDetector(
              child: Container(
                margin: EdgeInsets.only(top: 30.0),
                decoration: new BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(6.0),
                    boxShadow: [
                      BoxShadow(color: Colors.grey, offset: Offset(0.0, 4.0), blurRadius: 8.0)
                    ]
                ),
                width: 300.0,
                height: 50,
                child: new Container(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.pages, color: Colors.white, size: 40.0,),
                      Padding(padding: EdgeInsets.only(left: 40.0)),
                      new Text("Privacy Policy",style:  new TextStyle(color: Colors.white, fontSize: 25.0, letterSpacing: 2.0),),

                    ],
                  ),
                ),
              ),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicy())),
            ),
          ),

          Center(
            child: GestureDetector(
              child: Container(
                margin: EdgeInsets.only(top: 30.0),
                decoration: new BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(6.0),
                    boxShadow: [
                      BoxShadow(color: Colors.grey, offset: Offset(0.0, 4.0), blurRadius: 8.0)
                    ]
                ),
                width: 300.0,
                height: 50,
                child: new Container(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.help, color: Colors.white, size: 40.0,),
                      Padding(padding: EdgeInsets.only(left: 40.0)),
                      new Text("Contact Us",style:  new TextStyle(color: Colors.white, fontSize: 25.0, letterSpacing: 2.0),),

                    ],
                  ),
                ),
              ),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Help())),
            ),
          ),
          SizedBox(
            height: 250.0,
          ),
          Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocialMediaButton.instagram(
                      url: 'https://instagram.com/exerholic_fitness_studio?igshid=1kttjg7nwlr1s',
                      color: Colors.red,
                    size: 40.0,
                  ),
                  SizedBox(width: 10.0,),
                  SocialMediaButton.youtube(
                    url: 'https://www.youtube.com/channel/UCSUQx-u89x_pGJ_4rIW5b6w',
                    color: Colors.red,
                    size: 40.0,
                  ),
                  SizedBox(width: 10.0,),
                  SocialMediaButton.facebook(
                      url: 'https://www.facebook.com/exerholicfitnessstudio/',
                    size: 40.0,
                    color: Colors.blue,
                  )
                ],
              ),
          )


        ],
      ),
    );
  }


}
