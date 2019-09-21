import 'package:flutter/material.dart';
import 'inicio_sesion.dart';

void main() {
  runApp(Merixo());
}

const PrimaryColor = Color.fromRGBO(0, 0, 0, 1);
const SecundaryColor = Color.fromRGBO(255, 0, 0, 1); 

class Merixo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Merixo',
      theme: new ThemeData(
        primaryColor: PrimaryColor,
        primaryColorBrightness: Brightness.dark,
      ),
      home: new InicioSesion(),
    );
  }
}
