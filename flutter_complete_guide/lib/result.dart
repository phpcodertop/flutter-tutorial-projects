import 'package:flutter/material.dart';
class Result extends StatelessWidget {
  final int resultScore;
  final Function resetQuiz;
  Result(this.resultScore, this.resetQuiz);

  String get resultPhrase {
    var resultText = 'You did it.';
    if(resultScore <= 8) {
      resultText = 'You are awesome and innocent!';
    } else if(resultScore <= 12) {
      resultText = 'Pretty Likable';
    } else if(resultScore <= 16) {
      resultText = 'You are strange';
    } else {
      resultText = 'you are so bad';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 36.0,
              fontWeight: FontWeight.bold,
              color: Colors.pink,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            onPressed: resetQuiz,
            child: Text('Restart Quiz'),
          ),
        ],
      ),
    );
  }
}
