
import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final Function selectHandler;

  Answer(this.answerText, this.selectHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: RaisedButton(
        color: Colors.blue,
        onPressed: selectHandler,
        child: Text(
          answerText,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
