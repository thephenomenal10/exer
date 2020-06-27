import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


Widget packages({ BuildContext context, zumba, strongByZumba, powerYoga, functionalTraining, stepAerobics, animalFlow, bollyActive, hiit}) {

    return
        new GridView.count(
                crossAxisCount: 2,
                children: <Widget>[

                    //-----------1. ZUMBA-----------------------//
                    new Container(
                        child: new Card(
                            elevation: 6.0,
                            margin: EdgeInsets.all(8.0),
                            child: CupertinoButton(
                                child: Container(
                                    height: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fzumba.png?alt=media&token=f329e4f7-8e9a-4c96-8572-3c51be819f9d"),
                                            fit: BoxFit.fitHeight,
                                            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop)
                                        ),
                                        borderRadius: BorderRadius.circular(12)
                                    ),
                                ),
                                onPressed: (){Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => zumba),
                                );
                                },
                            ),
                        ),

                    ),

//-------------------------2. strong by zumba-------------------////////////
                    new Container(
                        child: new Card(
                            elevation: 6.0,
                            margin: EdgeInsets.all(8.0),
                            child: CupertinoButton(
                                child: Container(
                                    height: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fstrong_by_zumba.png?alt=media&token=ae605460-fc82-4b34-975f-ebd66b0a4fa1"),
                                            fit: BoxFit.cover,
                                            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop)
                                        ),
                                        borderRadius: BorderRadius.circular(12)
                                    ),

                                ),
                                onPressed: (){Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => strongByZumba),
                                );
                                },
                            ),
                        ),

                    ),

//-----------------------3. POWER YOGA----------------------------///
                    new Container(
                        child: new Card(
                            elevation: 6.0,
                            margin: EdgeInsets.all(8.0),
                            child: CupertinoButton(
                                child: Container(
                                    height: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fpower_yoga.png?alt=media&token=468164a1-e941-40f6-9cbf-bc90a37067d7"),
                                            fit: BoxFit.cover,
                                            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop)
                                        ),
                                        borderRadius: BorderRadius.circular(12)
                                    ),
                                ),
                                onPressed: (){Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => powerYoga),
                                );
                                },
                            ),
                        ),

                    ),
//-----------------------4. FUNCTIONAL TRAINING-----------------------//
                    new Container(
                        child: new Card(
                            elevation: 6.0,
                            margin: EdgeInsets.all(8.0),
                            child: CupertinoButton(
                                child: Container(
                                    height: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Ffunctional_training.png?alt=media&token=225e8810-29ce-40ad-9fb5-4d4baf5291ca"),
                                            fit: BoxFit.cover,
                                            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop)
                                        ),
                                        borderRadius: BorderRadius.circular(12)
                                    ),

                                ),
                                onPressed: (){Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => functionalTraining),
                                );
                                },
                            ),
                        ),

                    ),

//------------------------5. Step Aerobics-------------//

                    new Container(
                        child: new Card(
                            elevation: 6.0,
                            margin: EdgeInsets.all(8.0),
                            child: CupertinoButton(
                                child: Container(
                                    height: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fstep_aerobics.png?alt=media&token=eb842860-7db2-44d8-a442-a4101e2a70c2"),
                                            fit: BoxFit.cover,
                                            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop)
                                        ),
                                        borderRadius: BorderRadius.circular(12)
                                    ),

                                ),
                                onPressed: (){Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => stepAerobics ),
                                );
                                },
                            ),
                        ),

                    ),


                    ///-----------------6. Animal Flow---------------------///

                    new Container(
                        child: new Card(
                            elevation: 6.0,
                            margin: EdgeInsets.all(8.0),
                            child: CupertinoButton(
                                child: Container(
                                    height: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fanimal_flow.png?alt=media&token=4848a895-037a-423f-bbab-9f9f643ad06c"),
                                            fit: BoxFit.cover,
                                            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop)
                                        ),
                                        borderRadius: BorderRadius.circular(12)
                                    ),

                                ),
                                onPressed: (){Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => animalFlow ),
                                );
                                },
                            ),
                        ),

                    ),


                    ///-----------------------------7. Bolly active////////////////////////


                    new Container(
                        child: new Card(
                            elevation: 6.0,
                            margin: EdgeInsets.all(8.0),
                            child: CupertinoButton(
                                child: Container(
                                    height: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fbolly_active.png?alt=media&token=26855845-1b88-49ec-8f02-3dd2c6efc8fc"),
                                            fit: BoxFit.cover,
                                            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop)
                                        ),
                                        borderRadius: BorderRadius.circular(12)
                                    ),

                                ),
                                onPressed: (){Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => bollyActive ),
                                );
                                },
                            ),
                        ),

                    ),

/////-------------------------HIIT---------/////////


                    new Container(
                        child: new Card(
                            elevation: 6.0,
                            margin: EdgeInsets.all(8.0),
                            child: CupertinoButton(
                                child: Container(
                                    height: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/exerholic-e125d.appspot.com/o/app_photos%2Fhiit.png?alt=media&token=c70acc8d-5e6f-4910-a080-21b67d174ade"),
                                            fit: BoxFit.cover,
                                            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop)
                                        ),
                                        borderRadius: BorderRadius.circular(12)
                                    ),

                                ),
                                onPressed: (){Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => hiit),
                                );
                                },
                            ),
                        ),

                    ),
                ],
            );

}