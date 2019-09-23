import 'package:flutter/material.dart';
import 'inicio_sesion.dart';

void main() {
  runApp(Merixo());
}

const PrimaryColor = Color.fromRGBO(0, 64, 64, 1);
const SecundaryColor = Color.fromRGBO(255, 0, 0, 1);
const Red = Color.fromRGBO(253, 23, 23, 1);
  

class Merixo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Merixp",
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: PrimaryColor, 
        cursorColor: Red,
        accentColor: Red,
        fontFamily: 'Montserrat',
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      home: new InicioSesion()
    );
  }
  }
