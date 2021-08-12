import 'package:flutter/material.dart';
import 'package:full/main_drawer.dart';

void main (){
  runApp(MaterialApp(home: HomePage(),));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(title: Text('My application', style:TextStyle(fontSize: 20)), backgroundColor: Colors.redAccent,),
      body: Center(child: Text('Home page', style: TextStyle(color: Colors.redAccent,
          fontSize: 20, fontWeight: FontWeight.bold),)),
    );
  }
}
