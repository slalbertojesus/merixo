import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:merixo/models/getresponse.dart';
import 'dart:io';

class Confirmation extends StatefulWidget {
  final GetResponse usuario;
  final String operation;
  Confirmation({Key key, @required this.usuario, @required this.operation})
      : super(key: key);
  @override
  _ConfirmationState createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  String _tittle = "";

  @override
  Widget build(BuildContext context) {
    if (widget.operation == "name") {
      _tittle = "nombre";
    } else {
      _tittle = "estado";
    }
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Agregar " + _tittle),
        backgroundColor: Colors.black,
        actions: <Widget>[ 
        IconButton( icon: Icon(Icons.send), onPressed: (){} ),],
      ),
      body: Wrap(children: <Widget>[
        if (widget.operation == "name") changeName() else changeState()
      ]),
    );
  }

  Container changeName() {
    return Container(
        child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[])));
  }

  Container changeState() {
    return Container(
        child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[containsStateOps()])));
  }

  Container containsStateOps() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: Column(children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Ingresa tu nuevo estado'),
          )
        ]));
  }
}
