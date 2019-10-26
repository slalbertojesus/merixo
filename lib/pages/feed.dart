import 'package:flutter/material.dart';
import 'package:merixo/models/story.dart';
import 'package:merixo/data/api.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:merixo/main.dart';
import 'dart:convert';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  Story story;
  List<Story> _stories = [];
  Map<String, String> headers = {};
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  var _jsonResponse;

  @override
  void initState() {
    super.initState();
  }

  Future<List<Story>> _getFeed() async {
    final String token = await Merixo.shareUtils.get("token");
    String auth = "Token " + token;
    headers = {'Authorization': auth};
    _jsonResponse = await http.get(RestData.FEED_URL, headers: headers);
    if (_jsonResponse.statusCode == 200) {
      var rb = _jsonResponse.body;
      var list = json.decode(rb) as List;
      List<Story> stories = list.map((i) => Story.fromJson(i)).toList();
      return stories;
    } else {
      _showSnackBar("No se pudo conectar con el servidor");
      return null;
    }
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(text)));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: Stack(
          children: <Widget>[
            FutureBuilder(
              future: _getFeed(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return Container(
                    child: Center(
                      child: Text("Cargando..."),
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      Story story = snapshot.data[index];
                      return _placeFeed(story);
                    },
                  );
                }
              },
            ),
            _buttonPlus()
          ],
        ));
  }

  Column _placeFeed(Story story) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[Text(story.title)],
        ),
        SizedBox(width: 8.0),
        Container(
          height: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(RestData.SITE + story.pic),
              fit: BoxFit.contain,
            ),
          ),
        ),
        _iconsRow()
      ],
    );
  }

  Row _iconsRow() {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.favorite),
          iconSize: 30.0,
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.thumb_up),
          iconSize: 30.0,
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.thumb_down),
          iconSize: 30.0,
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.comment),
          iconSize: 30.0,
          onPressed: () {},
        ),
      ],
    );
  }

  Column _buttonPlus() {
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
      Container(
          child: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.only(right: 35, bottom: 35),
          child: IconButton(
            icon: Icon(
              Icons.add_circle,
              size: 60,
              color: Colors.red,
            ),
            onPressed: () {
              print("aylmai");
            },
          ),
        ),
      )),
    ]);
  }
}
