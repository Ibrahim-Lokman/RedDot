import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 500,
        child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (ctx, index){
             return Card(
                    child: Row( 
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget> [  
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget> [
                            Text(
                              transactions[index].title,
                              style: TextStyle(
                                
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.pink,
                              ),
                            ),
                            Text(
                              //DateFormat('yyyy-MM-dd')
                              DateFormat().format(transactions[index].date),
                               style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                              )
                          ],
                        ),
                        Container(
                          width: 100,
                          padding: EdgeInsets.all(12),
                          margin: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 154, 209, 200),
                            border: Border.all(
                              width: 2,
                              color: Color.fromARGB(255, 94, 0, 0),
                              )
                          ),
                          child: Text(
                            "\$ ${transactions[index].amount}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),),
                        ),
                        ],
                    ),
                    );
                    }
                ),
              );
  }
}