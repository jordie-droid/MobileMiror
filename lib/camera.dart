import 'package:flutter/material.dart';

class Camera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("CAMERA", style:TextStyle(fontSize: 20)),backgroundColor: Colors.redAccent,),
      body: Center(child: Text("CAMERA", style:TextStyle(fontSize: 20))),
    );
  }
}
