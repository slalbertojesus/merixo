import 'package:flutter/material.dart';

void main() {
  runApp(merixo());
}

const PrimaryColor = Color.fromRGBO(0, 0, 0,1);
const SecundaryColor = Color.fromRGBO(255, 0, 0, 1);

class merixo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: PrimaryColor,
          appBar: AppBar(
            backgroundColor: SecundaryColor,
            title: Text('merixo'),
          ),
          body: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Entra tu teléfono'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Entra tu contraseña'),
              ),
              FlatButton(
                onPressed: () {
                  /*...*/
                },
                child: Text(
                  "Ingresa",
                ),
              )
            ],
          )),
    );
  }
}
