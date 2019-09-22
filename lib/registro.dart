import 'package:flutter/material.dart';
import 'inicio_sesion.dart';

class Registro extends StatefulWidget {
  Registro({Key key}) : super(key: key);

  @override
  _RegistroState createState() => new _RegistroState();

}

class _RegistroState extends State<Registro> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child: ListView(
        shrinkWrap: true,
              padding: EdgeInsets.all(15.0),
      children: <Widget>[
    Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: Text('merixo',
            style: TextStyle(fontFamily: 'GalanoGrotesque', fontSize: 32)),
      ),
    ),
    GuiUtils.buildTextField("Usuario"),
    GuiUtils.buildTextField("Contraseña", "PasswordField"),
    GuiUtils.buildTextField("Nombre"),
    GuiUtils.buildTextField("Correo"),
    Center(
      child: Column (
          children: <Widget>[
            GuiUtils.buildButton("Registrate", context),
            GuiUtils.buildButton("Inicia Sesión", context),
          ],
      ),
    )
  ])));
  }
  
} 