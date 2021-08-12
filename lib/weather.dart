import 'package:flutter/material.dart';

class Weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  String city = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("METEO", style: TextStyle(fontSize: 20)),
          backgroundColor: Colors.redAccent),
      body: Column(
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration:
                    InputDecoration(hintText: "Veuillez saisir la ville"),
                onChanged: (value) {
                  setState(() {
                    city = value;
                  });
                },
              ),
            ),
          ),
          Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: WeatherDetails()));
                  },
                  child: Text(
                    "Valider",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  color: Colors.redAccent,
                  textColor: Colors.white,
                ),
              ))
        ],
      ),
    );
  }
}
