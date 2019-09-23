import 'package:flutter/material.dart';
import 'inicio_sesion.dart';

class Registro extends StatefulWidget {
  Registro({Key key}) : super(key: key);

  @override
  _RegistroState createState() => new _RegistroState();

}

class _RegistroState extends State<Registro> {
InicioSesion inicio = new InicioSesion();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child: ListView(
      padding: EdgeInsets.all(15.0),
      children: <Widget>[
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Text('merixo',
            style: TextStyle(fontFamily: 'GalanoGrotesque', fontSize: 32)),
      ),
    ),
    GuiUtils.buildTextField("Usuario"),
            SizedBox(height: 10.0,),
    GuiUtils.buildTextField("Contraseña", "PasswordField"),
            SizedBox(height: 10.0,),
    GuiUtils.buildTextField("Nombre"),
            SizedBox(height: 10.0,),
    GuiUtils.buildTextField("Correo"),
            SizedBox(height: 10.0,),
    Center(
      child: Column (
          children: <Widget>[
            GuiUtils.buildButton("Registrate", context),
            GuiUtils.buildBackButton("Inicia Sesión", context),
          ],
      ),
    )
  ])));
  }
  
} 