import 'package:expense_app/widgets/user_transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  //String titleInput;
  //String amountInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar( 
        title: Text("Expense App"),
        actions: <Widget>[
          IconButton(
            onPressed: () => {}, 
            icon: Icon(Icons.add),
            )
        ]
        ) ,
        body : SingleChildScrollView(
          child: Column(
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
              UserTransaction()
            ],
          ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
        ),
    );
  }
}
