import 'package:expense_app/widgets/new_transaction.dart';
import 'package:expense_app/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {

    final List<Transaction> _userTransactions = [
    Transaction(id: '2', title: 'Black Sports Shoe', amount: 38, date: DateTime.now()),
    Transaction(id: '3', title: 'Jet Black Shirt', amount: 30, date: DateTime.now()),
    Transaction(id: '4', title: 'White jeans', amount: 17, date: DateTime.now()),
    Transaction(id: '5', title: 'Laptop', amount: 1000, date: DateTime.now()),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      id: DateTime.now.toString(), 
      title: txTitle, 
      amount: txAmount, 
      date: DateTime.now());
    setState(() {
      _userTransactions.add(newTx);
    });
  
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
          NewTransaction(_addNewTransaction),
          TransactionList(_userTransactions)
      ],
    );
  }
}