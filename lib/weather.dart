import 'package:flutter/material.dart';

class Weather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("METEO", style:TextStyle(fontSize: 20)),backgroundColor: Colors.redAccent),
      body: Center(child: Text("WEATHER", style:TextStyle(fontSize: 20))),
    );
  }
}
