import 'package:carousel_pro/carousel_pro.dart';
import 'package:exerholic/pkgDescription/AnimalFlow.dart';
import 'package:exerholic/pkgDescription/BollyActive.dart';
import 'package:exerholic/pkgDescription/FunctionalTraining.dart';
import 'package:exerholic/pkgDescription/Hiit.dart';
import 'package:exerholic/pkgDescription/PowerYoga.dart';
import 'package:exerholic/pkgDescription/StepAerobics.dart';
import 'package:exerholic/pkgDescription/StrongByZumba.dart';
import 'package:exerholic/pkgDescription/zumba.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import './../youtube/playlist.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  double width, height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 4.0),
          ),
          Container(
            height: 300,
            child: Carousel(
              autoplayDuration: Duration(seconds: 10),
              boxFit: BoxFit.fitWidth,
              dotSize: 4.0,
              dotColor: Colors.white,
              autoplay: true,
              images: [
                NetworkImage(
                    "https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fgif1.gif?alt=media&token=3084230b-a467-4de8-aa84-7d1c4c37a608"),
                NetworkImage(
                    "https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fgif2.gif?alt=media&token=6b3d220e-b1ef-41bb-a327-5fd8831d5131"),
                NetworkImage(
                    "https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fgif3.gif?alt=media&token=70770c93-7de1-4952-b66d-70fd7c836ed4"),
                NetworkImage(
                    "https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fgif4.gif?alt=media&token=9fb40a5c-8630-4232-9d7e-0fdf88023564"),
                NetworkImage(
                    "https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fgif5.gif?alt=media&token=dad5fd7c-dd59-4a3f-a5a6-5f82c4dd7844"),
                NetworkImage(
                    "https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fgif6.gif?alt=media&token=0a808ba1-ce4a-4d51-9b1a-98a7af67c83c"),
                NetworkImage(
                    "https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fgif7.gif?alt=media&token=f0191e93-6c86-44c3-8b0c-52f31e7e85b4"),
                NetworkImage(
                    "https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fgif8.gif?alt=media&token=fed7d49c-d506-45de-bcf4-6f462a2866ad"),
              ],
            ),
          ),
          //   Padding(padding: EdgeInsets.only(top: 8.0),),

          //   Container(
          //     margin: EdgeInsets.only(left: width/40),
          //     child: new Text("Watch out your Training",
          //       style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
          //     ),
          //   ),

          // //////////------POPULAR TRAINING-------------
          //   //////////------FIRST ROW ------------/////////////////
          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Container(
          //     margin: EdgeInsets.only(left: width/50, top: width/30),
          //     child: new Row(

          //       children: <Widget>[
          //          SingleChildScrollView(
          //             scrollDirection: Axis.horizontal,
          //            child: new Card(
          //             elevation: 2.0,
          //             margin: EdgeInsets.all(5.0),
          //             child: CupertinoButton(
          //               child: Container(
          //                 height: width*2/10,
          //                 width: height/10,
          //                 decoration: BoxDecoration(
          //                     image: DecorationImage(
          //                         image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fpower_yoga.png?alt=media&token=468164a1-e941-40f6-9cbf-bc90a37067d7"),
          //                         fit: BoxFit.fitHeight,
          //                         colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop)
          //                     ),
          //                     borderRadius: BorderRadius.circular(12)
          //                 ),
          //               ),
          //               onPressed: (){Navigator.push(
          //                 context,
          //                 MaterialPageRoute(builder: (context) => PlayList(url: "https://power-yoga1.herokuapp.com/", title: "Power Yoga",)),
          //               );
          //               },
          //             ),
          //         ),
          //          ),
          //         SingleChildScrollView(
          //           scrollDirection: Axis.horizontal,
          //           child: new Card(
          //             elevation: 2.0,
          //             margin: EdgeInsets.all(5.0),
          //             child: CupertinoButton(
          //               child: Container(
          //                 height: width*2/10,
          //                 width: height/10,
          //                 decoration: BoxDecoration(
          //                     image: DecorationImage(
          //                         image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fzumba.png?alt=media&token=f329e4f7-8e9a-4c96-8572-3c51be819f9d"),
          //                         fit: BoxFit.fitHeight,
          //                         colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop)
          //                     ),
          //                     borderRadius: BorderRadius.circular(12)
          //                 ),
          //               ),
          //               onPressed: (){Navigator.push(
          //                 context,
          //                 MaterialPageRoute(builder: (context) => PlayList(url: "https://zumba-exerholic.herokuapp.com/", title: "Zumba",)),
          //               );
          //               },
          //             ),
          //           ),
          //         ),
          //         SingleChildScrollView(
          //           scrollDirection: Axis.horizontal,
          //           child: new Card(
          //             elevation: 2.0,
          //             margin: EdgeInsets.all(5.0),
          //             child: CupertinoButton(
          //               child: Container(
          //                 height: width*2/10,
          //                 width: height/10,
          //                 decoration: BoxDecoration(
          //                     image: DecorationImage(
          //                         image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fanimal_flow.png?alt=media&token=4848a895-037a-423f-bbab-9f9f643ad06c"),
          //                         fit: BoxFit.fitHeight,
          //                         colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop)
          //                     ),
          //                     borderRadius: BorderRadius.circular(12)
          //                 ),
          //               ),
          //               onPressed: (){Navigator.push(
          //                 context,
          //                 MaterialPageRoute(builder: (context) => AnimalFlow()),
          //               );
          //               },
          //             ),
          //           ),
          //         ),
          //         SingleChildScrollView(
          //           scrollDirection: Axis.horizontal,
          //           child: new Card(
          //             elevation: 2.0,
          //             margin: EdgeInsets.all(5.0),
          //             child: CupertinoButton(
          //               child: Container(
          //                 height: width*2/10,
          //                 width: height/10,
          //                 decoration: BoxDecoration(
          //                     image: DecorationImage(
          //                         image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fhiit.png?alt=media&token=c70acc8d-5e6f-4910-a080-21b67d174ade"),
          //                         fit: BoxFit.fitHeight,
          //                         colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop)
          //                     ),
          //                     borderRadius: BorderRadius.circular(12)
          //                 ),
          //               ),
          //               onPressed: (){Navigator.push(
          //                 context,
          //                 MaterialPageRoute(builder: (context) => Hiit()),
          //               );
          //               },
          //             ),
          //           ),
          //         ),

          //       ],
          //     ),
          //   ),
          // ),

//////////////////-----------------SECOND ROW//////////////
          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Container(
          //     margin: EdgeInsets.all(width/60),
          //     child: new Row(

          //       children: <Widget>[
          //         new Card(
          //           elevation: 2.0,
          //           margin: EdgeInsets.all(5.0),
          //           child: CupertinoButton(
          //             child: Container(
          //               height: width*2/10,
          //               width: height/10,
          //               decoration: BoxDecoration(
          //                   image: DecorationImage(
          //                       image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fstrong_by_zumba.png?alt=media&token=ae605460-fc82-4b34-975f-ebd66b0a4fa1"),
          //                       fit: BoxFit.fitHeight,
          //                       colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop)
          //                   ),
          //                   borderRadius: BorderRadius.circular(12)
          //               ),
          //             ),
          //             onPressed: (){Navigator.push(
          //               context,
          //               MaterialPageRoute(builder: (context) => StrongByZumba()),
          //             );
          //             },
          //           ),
          //         ),
          //         new Card(
          //           elevation: 2.0,
          //           margin: EdgeInsets.all(5.0),
          //           child: CupertinoButton(
          //             child: Container(
          //               height: width*2/10,
          //               width: height/10,
          //               decoration: BoxDecoration(
          //                   image: DecorationImage(
          //                       image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fzumba.png?alt=media&token=f329e4f7-8e9a-4c96-8572-3c51be819f9d"),
          //                       fit: BoxFit.fitHeight,
          //                       colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop)
          //                   ),
          //                   borderRadius: BorderRadius.circular(12)
          //               ),
          //             ),
          //             onPressed: (){Navigator.push(
          //               context,
          //               MaterialPageRoute(builder: (context) => Zumba()),
          //             );
          //             },
          //           ),
          //         ),

          //         new Card(
          //           elevation: 2.0,
          //           margin: EdgeInsets.all(5.0),
          //           child: CupertinoButton(
          //             child: Container(
          //               height: width*2/10,
          //               width: height/10,
          //               decoration: BoxDecoration(
          //                   image: DecorationImage(
          //                       image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fstep_aerobics.png?alt=media&token=eb842860-7db2-44d8-a442-a4101e2a70c2"),
          //                       fit: BoxFit.fitHeight,
          //                       colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop)
          //                   ),
          //                   borderRadius: BorderRadius.circular(12)
          //               ),
          //             ),
          //             onPressed: (){Navigator.push(
          //               context,
          //               MaterialPageRoute(builder: (context) => StepAerobics()),
          //             );
          //             },
          //           ),
          //         ),
          //         new Card(
          //           elevation: 2.0,
          //           margin: EdgeInsets.all(5.0),
          //           child: CupertinoButton(
          //             child: Container(
          //               height: width*2/10,
          //               width: height/10,
          //               decoration: BoxDecoration(
          //                   image: DecorationImage(
          //                       image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fstep_aerobics.png?alt=media&token=eb842860-7db2-44d8-a442-a4101e2a70c2"),
          //                       fit: BoxFit.fitHeight,
          //                       colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop)
          //                   ),
          //                   borderRadius: BorderRadius.circular(12)
          //               ),
          //             ),
          //             onPressed: (){Navigator.push(
          //               context,
          //               MaterialPageRoute(builder: (context) => FunctionalTraining()),
          //             );
          //             },
          //           ),
          //         ),

          //       ],
          //     ),
          //   ),
          // ),

          Padding(
            padding: EdgeInsets.only(top: 8.0),
          ),

          Container(
            margin: EdgeInsets.only(left: width / 40),
            child: new Text(
              "Your Favourite Packages",
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),

          //////-----------------WORKOUT......./////////
          //////////------FIRST ROW ------------/////////////////
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              margin: EdgeInsets.all(width / 60),
              child: new Row(
                children: <Widget>[
                  new Card(
                    elevation: 2.0,
                    margin: EdgeInsets.all(5.0),
                    child: CupertinoButton(
                      child: Container(
                        height: width * 2 / 10,
                        width: height / 10,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fzumba.png?alt=media&token=f329e4f7-8e9a-4c96-8572-3c51be819f9d"),
                                fit: BoxFit.fitHeight,
                                colorFilter: new ColorFilter.mode(
                                    Colors.black.withOpacity(0.8),
                                    BlendMode.dstATop)),
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Zumba()),
                        );
                      },
                    ),
                  ),
                  new Card(
                    elevation: 2.0,
                    margin: EdgeInsets.all(5.0),
                    child: CupertinoButton(
                      child: Container(
                        height: width * 2 / 10,
                        width: height / 10,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fanimal_flow.png?alt=media&token=4848a895-037a-423f-bbab-9f9f643ad06c"),
                                fit: BoxFit.fitHeight,
                                colorFilter: new ColorFilter.mode(
                                    Colors.black.withOpacity(0.8),
                                    BlendMode.dstATop)),
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AnimalFlow()),
                        );
                      },
                    ),
                  ),
                  new Card(
                    elevation: 2.0,
                    margin: EdgeInsets.all(5.0),
                    child: CupertinoButton(
                      child: Container(
                        height: width * 2 / 10,
                        width: height / 10,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fpower_yoga.png?alt=media&token=468164a1-e941-40f6-9cbf-bc90a37067d7"),
                                fit: BoxFit.fitHeight,
                                colorFilter: new ColorFilter.mode(
                                    Colors.black.withOpacity(0.8),
                                    BlendMode.dstATop)),
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PowerYoga()),
                        );
                      },
                    ),
                  ),
                  new Card(
                    elevation: 2.0,
                    margin: EdgeInsets.all(5.0),
                    child: CupertinoButton(
                      child: Container(
                        height: width * 2 / 10,
                        width: height / 10,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fbolly_active.png?alt=media&token=26855845-1b88-49ec-8f02-3dd2c6efc8fc"),
                                fit: BoxFit.fitHeight,
                                colorFilter: new ColorFilter.mode(
                                    Colors.black.withOpacity(0.8),
                                    BlendMode.dstATop)),
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BollyActive()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          //////////------SECOND ROW ------------/////////////////
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              margin: EdgeInsets.all(width / 60),
              child: new Row(
                children: <Widget>[
                  new Card(
                    elevation: 2.0,
                    margin: EdgeInsets.all(5.0),
                    child: CupertinoButton(
                      child: Container(
                        height: width * 2 / 10,
                        width: height / 10,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fhiit.png?alt=media&token=c70acc8d-5e6f-4910-a080-21b67d174ade"),
                                fit: BoxFit.fitHeight,
                                colorFilter: new ColorFilter.mode(
                                    Colors.black.withOpacity(0.8),
                                    BlendMode.dstATop)),
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Hiit()),
                        );
                      },
                    ),
                  ),
                  new Card(
                    elevation: 2.0,
                    margin: EdgeInsets.all(5.0),
                    child: CupertinoButton(
                      child: Container(
                        height: width * 2 / 10,
                        width: height / 10,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fstrong_by_zumba.png?alt=media&token=ae605460-fc82-4b34-975f-ebd66b0a4fa1"),
                                fit: BoxFit.fitHeight,
                                colorFilter: new ColorFilter.mode(
                                    Colors.black.withOpacity(0.8),
                                    BlendMode.dstATop)),
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => StrongByZumba()),
                        );
                      },
                    ),
                  ),
                  new Card(
                    elevation: 2.0,
                    margin: EdgeInsets.all(5.0),
                    child: CupertinoButton(
                      child: Container(
                        height: width * 2 / 10,
                        width: height / 10,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Ffunctional_training.png?alt=media&token=225e8810-29ce-40ad-9fb5-4d4baf5291ca"),
                                fit: BoxFit.fitHeight,
                                colorFilter: new ColorFilter.mode(
                                    Colors.black.withOpacity(0.8),
                                    BlendMode.dstATop)),
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FunctionalTraining()),
                        );
                      },
                    ),
                  ),
                  new Card(
                    elevation: 2.0,
                    margin: EdgeInsets.all(5.0),
                    child: CupertinoButton(
                      child: Container(
                        height: width * 2 / 10,
                        width: height / 10,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fstep_aerobics.png?alt=media&token=eb842860-7db2-44d8-a442-a4101e2a70c2"),
                                fit: BoxFit.fitHeight,
                                colorFilter: new ColorFilter.mode(
                                    Colors.black.withOpacity(0.8),
                                    BlendMode.dstATop)),
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => StepAerobics()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
