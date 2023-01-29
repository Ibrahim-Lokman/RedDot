import 'package:flutter/material.dart';
class Result extends StatelessWidget {

  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText ;

    if(resultScore >= 38){
      resultText = "Great Score";
    } else if (resultScore > 35) {
      resultText = "Good Score";
    } else if (resultScore > 30) {
      resultText = "Satisfactory Score";
    } else {
      resultText = "Low Score";
    }

  return resultText;

  }

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      primary: Colors.white,
      minimumSize: Size(88, 44),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
      backgroundColor: Colors.blue,
    );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(resultPhrase,
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            ),
          TextButton(
              style: flatButtonStyle,
              child: Text('Restart Quiz'),
              onPressed: resetHandler,
           ),
        ],
      ),
    );
  }
}