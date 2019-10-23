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
    List<Story> stories = list.map((i)=>Story.fromJson(i)).toList();
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
      child: FutureBuilder(
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
              return ListTile( 
                title: Text(snapshot.data[index].title),
              );
            },
          );
          }
        },
      ),
    );
  }
}
