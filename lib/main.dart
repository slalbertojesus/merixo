import 'package:flutter/material.dart';

void main() {
  runApp(merixo());
}

const PrimaryColor = const Color(0xFF151026);
const SecundaryColor = const Color(0xAF0404);

class merixo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: SecundaryColor,
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
