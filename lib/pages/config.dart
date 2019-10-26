import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:merixo/models/getresponse.dart';
import 'config_confirmation.dart';
import 'package:merixo/share/shareutils.dart';
import 'package:merixo/inicio_sesion.dart';
import 'package:merixo/main.dart';
import 'dart:io';

class Config extends StatefulWidget {
  final GetResponse usuario;
  Config({Key key, @required this.usuario}) : super(key: key);
  @override
  _ConfigState createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  final String CHANGE_STATE = "state";
  final String CHANGE_NAME = "name";
  double _size = 170.0;
  TabController controller;
  File _imageFile;
  String userProfilePic = "http://merixo.tk";

  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);
    setState(() {
      _imageFile = selected;
    });
  }

  void _clear() {
    setState(() {
      _imageFile = null;
    });
  }

  Future<void> _cropImage() async {
    File cropped = await ImageCropper.cropImage(
      sourcePath: _imageFile.path,
    );
    setState(() {
      _imageFile = cropped ?? _imageFile;
    });
  }

  closeSession() async {
    final preferences = await Merixo.shareUtils.sharedPreferencesInstance();
    preferences.clear();
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context)
         => InicioSesion()), (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Configurar perfil"),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.people), onPressed: () {
            closeSession();
          }),
        ],
      ),
      body: Wrap(runSpacing: 10, spacing: 20, children: <Widget>[
        SizedBox(height: 10),
        picSection(),
        infoSection(),
      ]),
    );
  }

  Container picSection() {
    return Container(
      child: Center(
        child: Container(
          width: _size,
          height: _size,
          decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  fit: BoxFit.cover,
                  image:
                      new NetworkImage(userProfilePic + widget.usuario.pic))),
          child: new Stack(children: <Widget>[
            IconButton(
              icon: Icon(Icons.add_a_photo, color: Colors.red),
              onPressed: () => _pickImage(ImageSource.gallery),
            )
          ]),
        ),
      ),
    );
  }

  Container infoSection() {
    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            RaisedButton(
              padding: const EdgeInsets.all(8.0),
              textColor: Colors.white,
              color: Colors.black,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Confirmation(
                          usuario: widget.usuario, operation: CHANGE_NAME)),
                );
              },
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.record_voice_over,
                    color: Colors.white,
                  ),
                  Text(
                    widget.usuario.name,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            RaisedButton(
              padding: const EdgeInsets.all(8.0),
              textColor: Colors.white,
              color: Colors.black,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Confirmation(
                          usuario: widget.usuario, operation: CHANGE_STATE)),
                );
              },
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                  Text(
                    widget.usuario.estado,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
