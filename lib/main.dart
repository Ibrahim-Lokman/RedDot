import 'package:flutter/material.dart';
import 'package:quiz_app/result.dart';
import './question.dart';
import './answer.dart';
import './quiz.dart';
import './result.dart';

//flutter section 2 Files

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  //Use of map data structure
   final _questions = const [
      {
      'questionText':'What\'s your favorite color?',
      'answers': [
        {'text' : 'Black', 'score' : 10},
        {'text' : 'Blue', 'score' : 8}, 
        {'text' : 'Red' , 'score' : 7}, 
        {'text' : 'Yellow', 'score' : 5}
        ],
      },
      {
      'questionText':'What\'s your favorite food?',
      'answers': [
        {'text' : 'Pizza', 'score' : 10},
        {'text' : 'Burger', 'score' : 8}, 
        {'text' : 'Pasta' , 'score' : 7}, 
        {'text' : 'Rice', 'score' : 5}
      ]
      },
      {
      'questionText':'Who\'s your favorite player?',
      'answers': [
        {'text' : 'CR7', 'score' : 10},
        {'text' : 'LM10', 'score' : 8}, 
        {'text' : 'Mbappe' , 'score' : 7}, 
        {'text' : 'Haaland', 'score' : 5}
      ]
      },
      {
      'questionText':'Which one will you choose?',
      'answers': [
        {'text' : 'Sea', 'score' : 10},
        {'text' : 'Hill', 'score' : 10}, 
        {'text' : 'Waterfal' , 'score' : 9}, 
        {'text' : 'Lake', 'score' : 8}
      ]
      },
      ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerSelected(int score){
    _totalScore = _totalScore + score;
   // Refresh state after answer being selected
    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
    if(_questionIndex < _questions.length){
        print("No more questions!");
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp (
      home : Scaffold(
        appBar: AppBar(
          title : Text("First App"),
        ),
        //Widget controlled by condition
        body: _questionIndex < _questions.length 
        ? Quiz( questions: _questions, answerSelected: _answerSelected, questionIndex: _questionIndex)
        : Result(_totalScore, _resetQuiz),
        ),
    );
  }
}
