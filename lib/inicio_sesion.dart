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
        body: Wrap(
            runSpacing: 20, // to apply margin vertically
            children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Center(
              child: Text('merixo',
                  style: TextStyle(fontFamily: 'GalanoGrotesque', fontSize: 32)),
            ),
          ),
          _buildTextField("Usuario"),
          _buildTextField("Contraseña"), 
          Center(
            child: Column (
               children: <Widget>[
            _buildButton("Ingresa"),
            _buildButton("Registrate"),
               ],
            ),
          )
        ]));
  }

  FlatButton _buildButton(String buttonIdentifier){
  FlatButton button = new FlatButton(
                 child: Text(
                   buttonIdentifier),
                   onPressed: () {
                     //
                     //
                   }, 
                   color: Color.fromRGBO(253, 23, 23, 1),
                );
                return button;;
  }

TextField _buildTextField(String textFieldMotive) {
    TextField texto = new TextField(
                      decoration: new InputDecoration(
                        labelText: textFieldMotive,
                        fillColor: Colors.black,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      style: new TextStyle(
                        fontFamily: "Poppins",
                      ),
      //decoration: InputDecoration(labelText: textFieldMotive),
    );
  return texto;
  }

}
