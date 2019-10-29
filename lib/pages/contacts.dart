import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:merixo/models/story.dart';
import 'package:merixo/data/api.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:merixo/main.dart';
import 'package:merixo/models/getresponse.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:convert';

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  Story story;
  bool _isVisible = false;
  List<Story> _stories = [];
  Map<String, String> headers = {};
  GetResponse contactos;
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  var _jsonResponse;

  Future<List<GetResponse>> _getContacts() async {
    final String token = await Merixo.shareUtils.get("token");
    String auth = "Token " + token;
    headers = {'Authorization': auth};
    _jsonResponse = await http.get(RestData.ALL_CONTACTS, headers: headers);
    if (_jsonResponse.statusCode == 200) {
      var rb = _jsonResponse.body;
      var list = json.decode(rb) as List;
      List<GetResponse> contactos =
          list.map((i) => GetResponse.fromJson(i)).toList();
      return contactos;
    } else {
      _showSnackBar("No se pudo conectar con el servidor");
    }
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(text)));
  }

  final cargando = SpinKitFadingCube(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? Colors.red : Colors.black,
        ),
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: Stack(
          children: <Widget>[
            FutureBuilder(
              future: _getContacts(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return Container(
                    child: Center(
                      child: cargando,
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      GetResponse contact = snapshot.data[index];
                      return _placeContacts(contact);
                    },
                  );
                }
              },
            ),
            _buttonPlus()
          ],
        ));
  }

  Column _placeContacts(GetResponse contact) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onLongPress:  () {
            setState(() {
              _isVisible = true;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 10.0,
            ),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 25.0,
                  backgroundColor: Colors.black,
                  backgroundImage: NetworkImage(RestData.SITE + contact.pic),
                ),
                Column(
                  children: <Widget>[
                    Text(contact.name),
                    Text(
                      contact.estado,
                      style: TextStyle(fontWeight: FontWeight.bold), 
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              
              ],
            ),
          ),
        )
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
