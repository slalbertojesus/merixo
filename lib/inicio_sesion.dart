import 'package:flutter/material.dart';
import 'registro.dart';


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
    GuiUtils.buildTextField("Usuario"),
    GuiUtils.buildTextField("Contraseña", "PasswordField"),
    Center(
      child: Column (
          children: <Widget>[
      GuiUtils.buildButton("Ingresa", context),
      GuiUtils.buildButton("Registrate", context),
          ],
      ),
    )
  ]));
  }

        }

class GuiUtils {

  static FlatButton buildButton(String buttonIdentifier, BuildContext context){
  FlatButton button = new FlatButton(
    child: Text(
      buttonIdentifier),
      onPressed: () {
        Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Registro()),
            );
      }, 
      color: Color.fromRGBO(253, 23, 23, 1),
  );
  return button;
  }

  static FlatButton buildBackButton(String buttonIdentifier, BuildContext context){
  FlatButton button = new FlatButton(
    child: Text(
      buttonIdentifier),
      onPressed: () {
        Navigator.pop(
              context
            );
      }, 
      color: Color.fromRGBO(253, 23, 23, 1),
  );
  return button;
  }

static TextField buildTextField(String textFieldMotive, [String pass]){ 
    bool band = false;
    if (pass == 'PasswordField'){
      band = true;
    }
    print(band.toString());
    TextField texto = new TextField(
    obscureText: band,
    decoration: new InputDecoration(
      labelText: textFieldMotive,
      hintStyle: TextStyle(fontSize: 20.0, color: Colors.redAccent),
      fillColor: Colors.black,
      border: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(25.0),
        borderSide: new BorderSide(
        ),
      ),
    ),
    keyboardType: TextInputType.visiblePassword,
    style: TextStyle(
      fontFamily: "Poppins",
    ),
    );
    return texto;
    }        
}
