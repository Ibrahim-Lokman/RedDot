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
   final questions = const [
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

    if(_questionIndex < questions.length){
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
        body: _questionIndex < questions.length ? Column(
          children: [
                  Question(
                    // using custom Question widget class, sending data to constructor
                    questions[_questionIndex]['questionText'] as String,
                  ),
                  // Sending answers/options related to a question one by one to answer widget class. 
                  ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
                    return Answer( _answerSelected, answer); 
                  }).toList()
          ],
        ) : Center(child: Text("Quiz is over!")),
        ),
    );
  }
}
