import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("QUESTIONS", style:TextStyle(fontSize: 20)),backgroundColor: Colors.redAccent,),
      body: Center(child: Text("QUIZ", style:TextStyle(fontSize: 20))),
    );
  }
}
