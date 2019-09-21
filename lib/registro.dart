import 'package:flutter/material.dart';

class Registro extends StatefulWidget {
  Registro({Key key}) : super(key: key);

  @override
  _RegistroState createState() => new _RegistroState();

}

class _RegistroState extends State<Registro> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _buildList(),
    );
  }
  
  Widget _buildList() {
    return new Text('Registro');
  }

} 