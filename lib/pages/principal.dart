import 'package:flutter/material.dart';
import 'package:merixo/pages/chat.dart';
import 'package:merixo/pages/contacts.dart';
import 'package:merixo/pages/feed.dart';
import 'package:http/http.dart' as http;
import 'package:merixo/pages/config.dart';
import 'package:merixo/models/getresponse.dart';
import 'package:merixo/models/loginresponse.dart';
import 'package:merixo/share/shareutils.dart';
import 'package:merixo/data/api.dart';
import 'dart:convert';
import 'package:merixo/main.dart';
import 'dart:ui';


class Principal extends StatefulWidget {
  final LoginResponse usuario;
  Principal({Key key, @required this.usuario}) : super(key: key);
  @override
  _PrincipalState createState() => new _PrincipalState();
}

class _PrincipalState extends State<Principal> with SingleTickerProviderStateMixin {
  List<Widget> pages = [Chat(),Feed(),Contacts()];
  TabController controller;
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  LoginResponse usuario;
  _PrincipalState({this.usuario});
  var _jsonResponse;
  GetResponse responseGet;
  Map <String, String> headers= {};

  @override
  void initState() {
    controller = new TabController(vsync: this, length: 3);
    this.getUserInfo();
    super.initState();
  }

  getUserInfo() async {
    final String token = await Merixo.shareUtils.get("token");
    String auth = "Token " + token;
    print("Token es "+ auth);
    headers = {'Authorization': auth};
    _jsonResponse = await http.get(RestData.PROPERTIES_URL, headers: headers);
    print("La respuesta es"+_jsonResponse.body);
    if (_jsonResponse.statusCode == 200) {
      Map _jsonBody = json.decode(_jsonResponse.body); 
      this.responseGet = GetResponse.fromJson(_jsonBody);
      print("La locación de la foto es: "+responseGet.pic);
    } else {
        _showSnackBar("No se pudo conectar con el servidor");
    } 
  }

   void _showSnackBar(String text) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(text)));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
          title: new Text("Merixo"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Config(usuario:responseGet)),
                  );
                }),
          ],
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          bottom: new TabBar(controller: controller, tabs: <Tab>[
            new Tab(text: "Chat"),
            new Tab(text: "Feed"),
            new Tab(text: "Contactos"),
          ])),
      body: new TabBarView(
        controller: controller,
        children: pages,
      ),
    );
  }
}
