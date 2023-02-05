import 'package:expense_app/widgets/transaction_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty 
    ? LayoutBuilder(
      builder: (ctx, Constraints){
      return Column(
         children: <Widget>[
          SizedBox(height: 25,),
          
          Text(
            'No transactions added yet!',
            style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
            ),
          SizedBox(height: 25,),
    
          Container(
            height: Constraints.maxHeight*0.2,
            child: Image.asset(
              'assets/images/waiting.png', 
              fit: BoxFit.cover,
              ),
          )
        ],
      );
      },
    )
    : ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (ctx, index){
         return TransactionItems(transaction: transactions[index], deleteTx: deleteTx);
          },


        );
  }
}

