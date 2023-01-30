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
    Transaction(id: '2', title: 'Black Sports Shoe', amount: 38, date: DateTime.now()),
    Transaction(id: '3', title: 'Jet Black Shirt', amount: 30, date: DateTime.now()),
    Transaction(id: '4', title: 'White jeans', amount: 17, date: DateTime.now()),
    Transaction(id: '5', title: 'Laptop', amount: 1000, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar( title: Text("Expense App"),) ,
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
            children: transactions.map((tx) {
              return Card(
                child: Row( 
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget> [  
                    Container(
                      width: 125,
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 201, 202, 203),
                        border: Border.all(
                          width: 2,
                          color: Colors.black
                          )
                      ),
                      child: Text(
                        "\$ ${tx.amount}",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget> [
                        Text(
                          tx.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink,
                          ),
                        ),
                        Text(
                          tx.date.toString(),
                           style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
