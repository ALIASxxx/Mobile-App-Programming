import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuit() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
  }

  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', "score": 8},
        {'text': 'Red', "score": 3},
        {'text': 'Green', 'score': 6},
        {'text': 'Blue', 'score': 1}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Monkey', 'score': 2},
        {'text': 'Giraffe', 'score': 7},
        {'text': 'Elephant', 'score': 4},
        {'text': 'Lion', 'score': 2}
      ]
    },
    {
      'questionText': 'What\'s your favorite book?',
      'answers': [
        {'text': 'Rage of Dragons', 'score': 1},
        {'text': 'Crescent City', 'score': 1},
        {'text': 'Red Rising', 'score': 1},
        {'text': 'Harry Potter', 'score': 7},
        {'text': 'The Hunger Games', 'score': 5}
      ]
    },
    {
      'questionText': 'What\'s your favorite anime?',
      'answers': [
        {'text': 'One Piece', 'score' : 1},
        {'text':'Demon Slayer', 'score':1},
        {'text':'Love is War', 'score':1},
        {'text':'My Hero Academia', 'score' : 4},
        {'text': 'One Punch Man', 'score':3}
      ]
    },
    {
      'questionText': 'What\'s your favorite TV show?',
      'answers': [
        {'text': 'The 100', 'score' : 3},
        {'text':'Squid Game', 'score':1},
        {'text':'The Office', 'score':2},
        {'text':'Arrow', 'score' : 3},
        {'text': 'Brooklyn Nine-Nine', 'score':4}
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuit),
      ),
    );
  }
}
