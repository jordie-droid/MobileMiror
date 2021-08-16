import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';

class WeatherDetails extends StatefulWidget {
  String city;
  WeatherDetails(this.city);
  @override
  _WeatherDetailsState createState() => _WeatherDetailsState();
}

class _WeatherDetailsState extends State<WeatherDetails> {
  var weatherData;

  @override
  void initState() {
    super.initState();
    getData(widget.city);
  }

  getData(String city) {
    String url =
        "https://api.openweathermap.org/data/2.5/forecast?q=${city}&appid=b8f1a24cf939fe62013fde03d7f21595";
    http.get(Uri.parse(url)).then((resp) {
      setState(() {
        weatherData = json.decode(resp.body);
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
          title: Text(
            "DETAIL METEO DE ${widget.city.toUpperCase()}",
            style: TextStyle(fontSize: 20),
          ),
          backgroundColor: Colors.redAccent,
        ),
        body: (weatherData == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount:
                    (weatherData == null ? 0 : weatherData["list"].length),
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.redAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: AssetImage(
                                "assets/${weatherData["list"][index]["weather"][0]["main"].toString().toLowerCase()}.png"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "${new DateFormat("E-dd-MM-yyyy").format(DateTime.fromMicrosecondsSinceEpoch(weatherData["list"][index]["dt"] * 1000000))}",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                Text(
                                  "${new DateFormat("HH:mm").format(DateTime.fromMicrosecondsSinceEpoch(weatherData["list"][index]["dt"] * 1000000))} | ${weatherData["list"][index]["weather"][0]["main"]}",
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                                "${weatherData["list"][index]["main"]["temp"].round()}°C",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                    ),
                  );
                },
              )));
  }
}
