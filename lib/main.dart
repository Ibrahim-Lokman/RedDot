import 'package:expense_app/transaction.dart';
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

  final List<Transaction> transactions = [
    Transaction(id: '2', title: 'Black Sports Shoe', amount: 3999, date: DateTime.now()),
    Transaction(id: '3', title: 'Jet Black Shirt', amount: 3270, date: DateTime.now()),
    Transaction(id: '4', title: 'White jeans', amount: 1500, date: DateTime.now()),
    Transaction(id: '5', title: 'Water', amount: 60, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title: Text("Expense App"),
        ) ,
      body : Column(
        mainAxisAlignment:  MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card( 
              color: Colors.blue,
              child : Text("Upper Portion \n ... \n ..."),
              elevation : 5,
            ),
          ),
          Column(
            children: transactions.map((e) {
              return Card(child: Text(e.title),);
            }).toList(),
          ),
        ],
      ),
    );
  }
}
