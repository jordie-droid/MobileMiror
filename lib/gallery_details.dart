import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';

class GalleryDetails extends StatefulWidget {
  String place = "";

  GalleryDetails(this.place);

  @override
  _GalleryDetailsState createState() => _GalleryDetailsState();
}

class _GalleryDetailsState extends State<GalleryDetails> {
  int currentPage = 1;
  int size = 5;
  List<dynamic> hits = [];
  var galleryData;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() {
    String uri =
        "https://pixabay.com/api/?key=22913420-14bb84fdb88563884600ce526&q=${widget.place}&page=${currentPage}&per_page=${size}";

    http.get(Uri.parse(uri)).then((resp) {
      setState(() {
        galleryData = json.decode(resp.body);
        hits = galleryData["hits"];
        print(hits);
      });
      print(resp.body);
    }).catchError((error) {
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.place.toUpperCase()}"),
          backgroundColor: Colors.redAccent,
        ),
        body: (galleryData == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: (galleryData == null ? 0 : hits.length),
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(right: 10, left: 10),
                        child: Card(
                          color: Colors.redAccent,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Center(
                              child: Text("${hits[index]["tags"]}",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Card(
                          child: Image.network("${hits[index]["webformatURL"]}", fit: BoxFit.fitWidth,),
                        ),
                        padding: EdgeInsets.only(left: 10, right: 10),
                      )
                    ],
                  );
                },
              )));
  }
}
