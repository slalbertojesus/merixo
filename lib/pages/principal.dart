import 'package:flutter/material.dart';
import 'package:merixo/grpc/services/chat_servicio.dart';
import 'package:merixo/pages/chat.dart';
import 'package:merixo/pages/contacts.dart';
import 'package:merixo/pages/feed.dart';
import 'package:http/http.dart' as http;
import 'package:merixo/pages/config.dart';
import 'package:merixo/models/getresponse.dart';
import 'package:merixo/models/loginresponse.dart';
import 'package:merixo/data/api.dart';
import 'package:merixo/grpc/generated_code/chat.pb.dart' as structure;
import 'package:merixo/grpc/generated_code/chat.pbgrpc.dart' as grpc;
import 'package:merixo/models/client.dart';
import 'dart:convert';
import 'package:merixo/main.dart';


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
    headers = {'Authorization': auth};
    _jsonResponse = await http.get(RestData.PROPERTIES_URL, headers: headers);
    if (_jsonResponse.statusCode == 200) {
      Map _jsonBody = json.decode(_jsonResponse.body); 
      this.responseGet = GetResponse.fromJson(_jsonBody);
      Client cliente = new Client();
      cliente.id = responseGet.email;
      cliente.username = responseGet.username;
      cliente.estado = true;
      print("Se creó cliente");
      subscribirse(cliente);
    } else {
        _showSnackBar("No se pudo conectar con el servidor");
    } 
  }

    Future<void> subscribirse(Client cliente) async {
      Client datos = cliente;
      print("Se añadió cliente");
    var res = await ChatAdmin.subscribirse(datos);
    print(res);
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
