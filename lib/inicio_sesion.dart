import 'package:flutter/material.dart';

class InicioSesion extends StatefulWidget {
  InicioSesion({Key key}) : super(key: key);

  @override
  _InicioSesionState createState() => new _InicioSesionState();

}

class _InicioSesionState extends State<InicioSesion> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _buildList(),
    );
  }
  
  Widget _buildList() {
    TextField textFieldNombre =_buildTextField("Entra tu nombre");
    return textFieldNombre;
  }

  TextField _buildTextField(String textFieldMotive) {
    return TextField(
              decoration: InputDecoration(labelText: textFieldMotive),
            );
  }

}

