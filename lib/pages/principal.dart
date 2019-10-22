import 'package:flutter/material.dart';
import 'package:merixo/pages/chat.dart';
import 'package:merixo/pages/contacts.dart';
import 'package:merixo/pages/feed.dart';
import 'package:merixo/pages/config.dart';

class Principal extends StatefulWidget {
  Principal({Key key}) : super(key: key);

  @override
  _PrincipalState createState() => new _PrincipalState();
}

class _PrincipalState extends State<Principal>
    with SingleTickerProviderStateMixin {
  List<Widget> pages = [Chat(), Contacts(), Feed()];
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("Merixo"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Config()),
                  );
                }),
          ],
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          bottom: new TabBar(controller: controller, tabs: <Tab>[
            new Tab(text: "Chat"),
            new Tab(text: "Feed"),
            new Tab(text: "Contactos"),
          ])),
      body: new TabBarView(
        controller: controller,
        children: pages,
      ),
    );
  }
}
