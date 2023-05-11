import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback reset;

  Result(this.resultScore,this.reset);

  String get resultPhrase {
    var resultText;
    if (resultScore <= 20) {
      resultText = 'you are awesome and innocent!';
    } else if (resultScore < 30) {
      resultText = 'Pretty okay';
    } else {
      resultText = 'you have to work on yourself';
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
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(child: Text('Restart Quiz!'),onPressed: reset,)
        ],
      ),
    );
  }
}
