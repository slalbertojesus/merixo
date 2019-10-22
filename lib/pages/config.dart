import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:io';

class Config extends StatefulWidget {
  @override
  _ConfigState createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  double _size = 150.0;
  TabController controller;
  File _imageFile;

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

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Merixo"),
        backgroundColor: Colors.black,
      ),
      body: Wrap(children: <Widget>[
        IconButton(
            icon: Icon(Icons.add_a_photo),
            onPressed: () => _pickImage(ImageSource.gallery),
            ), 
             Center(
               child: Container(
            width: _size,
            height: _size,
            decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.cover,
                      image: new NetworkImage(
                          "http://merixo.tk/media/perfil/choco/robgmail.com-robgmail.com.jpg")
                  )
            )
        ),
             ),
      ]),
    );
  }
}

        /* if  (_imageFile != null) 
                Image.file(_imageFile)
           else  */

 
  
/*       return Center(
        child: new Container(
            width: _size,
            height: _size,
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    fit: BoxFit.cover,
                    image: new NetworkImage(
                        "https://www.woolha.com/media/2019/06/buneary.jpg")
                )
            )
        ),
      ); */
