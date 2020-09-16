import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var questionIndex = 0;
  var _totalScore = 0;

  final _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Ahmed', 'score': 1},
        {'text': 'Maher', 'score': 1},
        {'text': 'Ahmed', 'score': 1},
        {'text': 'Halima', 'score': 1},
      ],
    },
  ];

  void answerQuestion(int score) {
    if(questionIndex < _questions.length) {
      setState(() {
        _totalScore += score;
        questionIndex++;
      });
    }
  }

  void resetQuiz() {
    setState(() {
      _totalScore = 0;
      questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Questions App'),
        ),
        body: (questionIndex < _questions.length) ? Quiz(
            _questions, questionIndex, answerQuestion
        ) :
        Result(_totalScore, resetQuiz),
      ),
    );
  }
}