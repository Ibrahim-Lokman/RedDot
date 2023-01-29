import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';


class Quiz extends StatelessWidget {

  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerSelected;

  Quiz({ required this.questions, required this.answerSelected, required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
                  Question(
                    // using custom Question widget class, sending data to constructor
                    questions[questionIndex]['questionText'] as String,
                  ),
                  // Sending answers/options related to a question one by one to answer widget class. 
                  ...(questions[questionIndex]['answers'] as List<Map<String, Object>>).map((answer) {
                    return Answer(() => answerSelected(answer['score']), answer['text'] as String); 
                  }).toList()
          ],
    );
  }

}