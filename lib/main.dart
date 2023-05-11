import 'package:flutter/material.dart';
import 'package:quiz/result.dart';
import './quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  static const _question = [
    {
      'questionText': 'what is your favourite color?',
      'answers': [
        {'text':'Black','score':10},
        {'text':'Red','score':5},
        {'text':'Green','score':3},
        {'text': 'White','score':1}
      ]
    },
    {
      'questionText': 'what is your favourite animal?',
      'answers': [
        {'text':'Dog','score':10},
        {'text':'Cat','score':5},
        {'text':'Cow','score':3},
        {'text': 'Rabbit','score':1}
      ]
    },
    {
      'questionText': 'which is your favourite Country?',
      'answers': [
        {'text':'India','score':10},
        {'text':'US','score':5},
        {'text':'UK','score':3},
        {'text': 'Russia','score':1}
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore=0;

  void _resetQuiz()
  {
    setState(() {
      _questionIndex = 0;
      _totalScore=0;
    });
  }

  void _answerChosen(int score) {
    _totalScore+=score;
    if (_questionIndex < _question.length) {
      print("we have no more question");
    }
    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("MyQuizApp"),
        ),
        body: _questionIndex < _question.length
            ? Quiz(answerQuestion: _answerChosen, questionIndex: _questionIndex,
               questions: _question,)
            : Result(_totalScore,_resetQuiz)
      ),
    );
  }
}
