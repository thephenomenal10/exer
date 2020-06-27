import 'package:flutter/material.dart';
import 'package:social_media_buttons/social_media_buttons.dart';


class Help extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new SafeArea(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocialMediaButton.instagram(
                  url: 'https://instagram.com/exerholic_fitness_studio?igshid=1kttjg7nwlr1s',
                  color: Colors.red,
                  size: 70.0,
                ),
                SizedBox(width: 10.0,),
                SocialMediaButton.youtube(
                  url: 'https://www.youtube.com/channel/UCSUQx-u89x_pGJ_4rIW5b6w',
                  color: Colors.red,
                  size: 70.0,
                ),
                SizedBox(width: 10.0,),
                SocialMediaButton.facebook(
                  url: 'https://www.facebook.com/exerholicfitnessstudio/',
                  size: 70.0,
                  color: Colors.blue,
                )
              ],
            ),
          ),
      ),

    );
  }

}