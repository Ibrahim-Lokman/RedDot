import 'dart:ui';

import 'package:expense_app/models/education.dart';
import 'package:expense_app/widgets/edu_list.dart';
import 'package:expense_app/widgets/education_list.dart';
import 'package:expense_app/widgets/new_transaction.dart';
import 'package:expense_app/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'models/transaction.dart';
import 'widgets/chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title : 'Expense Tracker',
      theme : ThemeData(
        primarySwatch: Colors.blueGrey,  
        accentColor: Colors.pink,
        fontFamily: 'ChrustyRock',
        textTheme : ThemeData.light().textTheme.copyWith(
            subtitle1: TextStyle(
              fontFamily: 'Branda',
                fontSize: 20,
          ),
        ),
        appBarTheme : AppBarTheme(
          toolbarTextStyle: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
              fontFamily: 'Branda',
              fontSize: 20,
            ),
          ).bodyText2, 
         titleTextStyle : ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
              fontFamily: 'Branda',
              fontSize: 20,
            ),
          ).headline6,
        )
      ),
      home : MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   final List<Transaction> _userTransactions = [ /*
    Transaction(id: '2', title: 'Black Sports Shoe', amount: 38, date: DateTime.now()),
    Transaction(id: '3', title: 'Jet Black Shirt', amount: 30, date: DateTime.now()),
    Transaction(id: '4', title: 'White jeans', amount: 17, date: DateTime.now()),
    Transaction(id: '5', title: 'Laptop', amount: 1000, date: DateTime.now()),
 */ ];


// extra
     final List<Education> _userEducations = [  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ), 
      );
    }).toList();
  }
  
  void _addNewTransaction(
    String txTitle, 
    double txAmount, 
    DateTime chosenDate) {
    final newTx = Transaction(
      id: DateTime.now().toString(), 
      title: txTitle, 
      amount: txAmount, 
      date: chosenDate,
      );
    
    setState(() {
      _userTransactions.add(newTx);
    });  
  }

//extra
  void _addNewEducation( String eduTitle, int eduYear) {
      final newEdu = Education(
      id: DateTime.now().toString(), 
      titleEdu: eduTitle, 
      year: eduYear, 
      );
    
    setState(() {
      _userEducations.add(newEdu);
    });  
  }

  
  //String titleInput;
  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx, 
      builder: (_) {
         return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
          );
      },);
  }


//Extra
  void _startAddNewEducation(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx, 
      builder: (_) {
         return GestureDetector(
         // onTap: () {},
          child: NewEducation(_addNewEducation),
        //  behavior: HitTestBehavior.,
          );
      },);
  }



  void _deleteTransaction(String id){
    setState(() {
      _userTransactions.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }


//extra
  void _deleteEducation(String id){
    setState(() {
      _userEducations.removeWhere((edu) {
        return edu.id == id;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar( 
        title: Text(
          "Expense Tracker"
          ),
          
        actions: <Widget>[
          IconButton(
            onPressed: () => _startAddNewTransaction(context), 
            icon: Icon(Icons.add),
            )
        ]
        ) ,
        body : SingleChildScrollView(
          child: Column(
           // mainAxisAlignment:  MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
             // Chart(_recentTransactions),
              //TransactionList(_userTransactions, _deleteTransaction),
              Card(child: NewEducation(_addNewEducation)),
              
              Card(child: EducationList(_userEducations, _deleteEducation)),
            ],
          ),
      ),

      /*
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewEducation(context),
        ),
     */
     /*
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
        ),

        */
    );
  }
}
