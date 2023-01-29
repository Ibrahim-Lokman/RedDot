import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';


class Quiz extends StatelessWidget {

  final List<Map<String, Object>> questions;
  final VoidCallback _answerSelected;

  Quiz(this.questions, this._answerSelected);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }

}