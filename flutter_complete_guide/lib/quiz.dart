import 'package:flutter/material.dart';
import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {

  List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(this.questions, this.questionIndex, this.answerQuestion);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]['questionText']),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>).map((answer) {
          return Answer(answer['text'], () => answerQuestion(answer['score']));
        }).toList(),
      ],
    );
  }
}
