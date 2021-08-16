import 'package:flutter/material.dart';
import './gallery_details.dart';

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  String place = "";
  TextEditingController placeText = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GALERIE", style: TextStyle(fontSize: 20)),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: placeText,
              decoration: InputDecoration(hintText: "Saisissez le mot clé"),
              onChanged: (value) {
                setState(() {
                  place = value;
                });
              },
              onSubmitted: (value) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GalleryDetails(place)));
                placeText.text = "";
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              child: RaisedButton(
                  color: Colors.redAccent,
                  textColor: Colors.white,
                  child: Text("Valider"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GalleryDetails(place)));
                    placeText.text = "";
                  }),
            ),
          )
        ],
      ),
    );
  }
}
