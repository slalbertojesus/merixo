import 'package:flutter/material.dart';

void main (){
  runApp(merixo());
}

class merixo extends StatelessWidget{
 @override
  Widget build(BuildContext context){
    return MaterialApp(home: Scaffold(
      appBar: AppBar(title: Text('merixo'),),
      body: Text('default text'),
    ),);
  }
}