import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetQuiz;

  Result(this.resultScore, this.resetQuiz);

  String get ResultPhrase {
    if (resultScore <= 12) {
      return 'You have good taste! Yay!';
    }
    else if (resultScore <= 16) {
      return 'You have okay taste, I guess';
    }
    else {
      return 'Eww ... You have bad taste :(';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            ResultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
              child: Text('Restart Quiz'),
              onPressed: resetQuiz,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ))
        ],
      ),
    );
  }
}
