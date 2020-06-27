import 'dart:async';
import 'dart:convert';

import 'package:exerholic/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './videoScreen.dart';

class PlayList extends StatefulWidget {
  PlayList({this.title, this.url});
  final String title;
  final String url;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PlayListState();
  }
}

class PlayListState extends State<PlayList> {
  Future<List> getData() async {
    final response = await http.get(widget.url);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: Container(
          margin: EdgeInsets.only(left: 20.0),
            child: Image(
          image: AssetImage("assets/logo.png"),
          height: 20.0,
          width: 10.0,
        )),
        title: new Text(
          widget.title,
          style: new TextStyle(color: (Colors.white)),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ListVideo(
                  list: snapshot.data,
                )
              : Center(child: new CircularProgressIndicator());
        },
      ),
    );
  }
}

class ListVideo extends StatelessWidget {
  final List list;
  ListVideo({this.list});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build+
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 6.0,
              color: Colors.black,
              child: new Column(
                children: <Widget>[
                  new GestureDetector(
                    onTap: () =>
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) => new VideoPlay(
                                  url:
                                      "https://youtube.com/embed/${list[i]['contentDetails']['videoId']}",
                                ))),
                    child: new Container(
                      height: 180.0,
                      decoration: new BoxDecoration(
                          image: new DecorationImage(
                              image: new NetworkImage(list[i]['snippet']
                                  ['thumbnails']['high']['url']),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(10.0),
                  ),
                  new Text(
                    list[i]['snippet']['title'],
                    style: new TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                  new Divider()
                ],
              ),
            ));
      },
    );
  }
}
