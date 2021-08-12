import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int currentQuestion = 0;
  int score = 0;

  var quiz = [
    {
      "title": "Question 1",
      "answers": [
        {"answer": "Answer 11", "correcte": false},
        {"answer": "Answer 12", "correcte": true},
        {"answer": "Answer 13", "correcte": false}
      ]
    },
    {
      "title": "Question 2",
      "answers": [
        {"answer": "Answer 21", "correcte": false},
        {"answer": "Answer 22", "correcte": false},
        {"answer": "Answer 23", "correcte": true}
      ]
    },
    {
      "title": "Question 3",
      "answers": [
        {"answer": "Answer 31", "correcte": true},
        {"answer": "Answer 32", "correcte": false},
        {"answer": "Answer 33", "correcte": false}
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QUESTIONS", style: TextStyle(fontSize: 20)),
        backgroundColor: Colors.redAccent,
      ),
      body: (currentQuestion >= quiz.length)
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "${(score / quiz.length * 100).round()} %",
                    style: TextStyle(fontSize: 22, color: Colors.redAccent),
                  ),
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        currentQuestion = 0;
                        score = 0;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Redémarrer...", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    textColor: Colors.white,
                    color: Colors.redAccent,
                  )
                ],
              ),
            )
          : ListView(
              children: <Widget>[
                ListTile(
                  title: Center(
                      child: Text(
                    "Question ${currentQuestion + 1}/${quiz.length}",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold),
                  )),
                ),
                ListTile(
                  title: Text(
                    "${quiz[currentQuestion]["title"]} ?",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                ...(quiz[currentQuestion]["answers"]
                        as List<Map<String, Object>>)
                    .map((answer) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      color: Colors.redAccent,
                      textColor: Colors.white,
                      onPressed: () {
                        setState(() {
                          if (answer["correcte"] == true) ++score;
                          ++currentQuestion;
                        });
                      },
                      child: Text(
                        answer["answer"],
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                  );
                })
              ],
            ),
    );
  }
}
