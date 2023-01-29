import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

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
      'questionText':'What\'s favorite color?',
      'answers': ['Black', 'Blue', 'Red', 'Yellow'],
      },
      {
      'questionText':'What\'s favorite subject?',
      'answers': ['Maths', 'English', 'Story', 'Physics'],
      },
      {
      'questionText':'5 + 6 = ...?',
      'answers': ['10','9','11','12'],
      },
      ];
  var _questionIndex = 0;

  void _answerSelected(){

    if(_questionIndex < _questions.length){
        print("No more questions!");
    }

   // Refresh state after answer being selected
    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
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
        ? Quiz(_answerSelected, _questions)
        : Center(child: Text("Quiz is over!")),
        ),
    );
  }
}
