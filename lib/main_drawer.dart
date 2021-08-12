import 'package:flutter/material.dart';
import './camera.dart';
import './gallery.dart';
import './weather.dart';
import './quiz.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(child: ListView(children: <Widget>[
      new DrawerHeader(child:
      Center(child: CircleAvatar(radius: 50,
        backgroundColor: Colors.white10,
        backgroundImage: AssetImage('assets/jordie.png'),),),
        decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.redAccent, Colors.white10])),
      ),
      ListTile(
        title: (Text("Questions", style: TextStyle(color: Colors.redAccent, fontSize: 16))),
        onTap: (){
          Navigator.of(context).pop();
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Quiz()));
        },
      ),
      Divider(),
      ListTile(
        title: (Text("Météo", style: TextStyle(color: Colors.redAccent, fontSize: 16))),
        onTap: (){
          Navigator.of(context).pop();
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Weather()));
        },
      ),
      Divider(),
      ListTile(
        title: (Text("Galerie", style: TextStyle(color: Colors.redAccent, fontSize: 16))),
        onTap: (){
          Navigator.of(context).pop();
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Gallery()));},
      ),
      Divider(),
      ListTile(
        title: (Text("Caméra", style: TextStyle(color: Colors.redAccent, fontSize: 16))),
        onTap: (){
          Navigator.of(context).pop();
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Camera()));},
      )
    ],),);
  }
}
