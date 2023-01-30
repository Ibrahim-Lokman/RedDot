import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title : 'Flutter App',
      home : MyHomePage(),
    );
}
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title: Text("Expense App"),
        ) ,
      body : Column(
        children: <Widget>[
          Card(
            //here card size will depends on Text widget, so we can not increase size
            child : Text("Upper Portion"),
            elevation : 5,
          ),
          Card(
            child : Text("Lower Portion"),
            elevation : 5,

          ),
        ],
      ),
    );
  }
}
