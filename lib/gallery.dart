import 'package:flutter/material.dart';

class Gallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GALERIE", style:TextStyle(fontSize: 20)),backgroundColor: Colors.redAccent,),
      body: Center(child: Text("GALLERY", style:TextStyle(fontSize: 20))),
    );
  }
}
