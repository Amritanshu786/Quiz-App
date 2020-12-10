import 'package:flutter/material.dart';
import 'package:my_app/result.dart';

import './quiz.dart';

void main() {
  runApp(MyApp());
}
// void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // ToD: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalscore = 0;

  final _questions = const [
    {
      'questionText': "Which function is used to write a single character to console in C++?",
      'answers': [
        {'text': 'cout.put(ch)', 'score': 1},
        {'text': 'cout.putline(ch)', 'score': 0},
        {'text': 'write(ch)', 'score': 0},
        {'text': 'printf(ch)', 'score': 0}
      ],
    },
    {
      'questionText': "Which of the following escape sequence represents carriage return?",
      'answers': [
        {'text': "\\r", 'score': 1},
        {'text': "\\n", 'score': 0},
        {'text': "\\n\\r", 'score': 0},
        {'text': "\\c", 'score': 0}
      ],
    },
    {
      'questionText': 'What\'s the size of void in bytes?',
      'answers': [
        {'text': '1', 'score': 0},
        {'text': '2', 'score': 0},
        {'text': '4', 'score': 0},
        {'text': '0', 'score': 1}
      ],
    },
    {
      'questionText': 'A language which has the capability to generate new data types are called ________________',
      'answers': [
        {'text': 'Extensible', 'score': 1},
        {'text': 'Overloaded', 'score': 0},
        {'text': 'Encapsulated', 'score': 0},
        {'text': 'Reprehensible', 'score': 0}
      ],
    },
    {
      'questionText': 'Wrapping data and its related functionality into a single entity is known as _____________',
      'answers': [
        {'text': 'Abstraction', 'score': 0},
        {'text': 'Encapsulation', 'score': 1},
        {'text': 'Polymorphism', 'score': 0},
        {'text': 'Modularity', 'score': 0}
      ],
    },
  ];
  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalscore = 0;
    });
  }
  void _answerQuestion(int score) {
    _totalscore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print("There are more questions!");
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My first App'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  questions: _questions,
                  questionIndex: _questionIndex,
                  answerQuestion: _answerQuestion,
                )
              : Result(_totalscore, _resetQuiz),
      ),
    );
  }
}
