import 'package:flutter/material.dart';
import 'package:merixo/registro.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'json_objects/loginresponse.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'registro.dart';
import 'package:merixo/pages/principal.dart';

class InicioSesion extends StatefulWidget {
  InicioSesion({Key key}) : super(key: key);
  @override
  _InicioSesionState createState() => new _InicioSesionState();
}

class _InicioSesionState extends State<InicioSesion> {
  SharedPreferences sharedPreferences;
  final String urlLogin = "http://merixo.tk/login";
  var loginResponse;
  bool isLoading;

  @override
  void initState() {
    super.initState();
    //checkLoginStatus();
  } 
  
  //metodo para checar si existe un token en el caché, si es así. te manda a la página de login}
  //se elimina si ejecutas sharedPreferences.clear();
  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) =>
       InicioSesion()), (Route<dynamic> route) => false);
    }
  }

  signIn(String email, pass) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print(email);
    print(pass);
    Map data = {'email': email, 'password': pass};
    var response = await http.post(urlLogin, body: data);
    if (response.statusCode == 200) {
      loginResponse = json.decode(response.body);
      final Map parsed = json.decode(response.body); 
      final usuario = LoginResponse.fromJson(parsed);
      if (loginResponse != null) {
        setState(() {
          isLoading = false;
        });
        sharedPreferences.setString("token", loginResponse['token']);
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Principal()),
          );
      }
    } else {
      setState(() {
        isLoading = false;
      });
      print(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.black,
        body: Wrap(runSpacing: 20, // to apply margin vertically
            children: <Widget>[
          headerSection(),
          textSection(),
          buttonSection(),
        ]));
  }

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  Container headerSection() {
    return Container(
      margin: EdgeInsets.only(top: 50.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      child: Text('merixo',
          style: TextStyle(fontFamily: 'GalanoGrotesque', fontSize: 32)),
    );
  }

  Container textSection() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: Column(children: <Widget>[
          TextField(
            controller: emailController,
            obscureText: false,
            decoration: new InputDecoration(
              labelText: "Email",
              hintStyle: TextStyle(fontSize: 20.0, color: Colors.redAccent),
              fillColor: Colors.black,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(25.0),
                borderSide: new BorderSide(),
              ),
            ),
            keyboardType: TextInputType.visiblePassword,
            style: TextStyle(
              fontFamily: "Poppins",
            ),
          ),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: new InputDecoration(
              labelText: "Password",
              hintStyle: TextStyle(fontSize: 20.0, color: Colors.redAccent),
              fillColor: Colors.black,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(25.0),
                borderSide: new BorderSide(),
              ),
            ),
            keyboardType: TextInputType.visiblePassword,
            style: TextStyle(
              fontFamily: "Poppins",
            ),
          ),
        ]));
  }

  Container buttonSection() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40.0,
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      margin: EdgeInsets.only(top: 15.0),
      child: FlatButton(
        child: Text("Ingresa"),
        onPressed: () {
          signIn(emailController.text, passwordController.text);
        },
        color: Color.fromRGBO(253, 23, 23, 1),
      ),
    );
  }
}
