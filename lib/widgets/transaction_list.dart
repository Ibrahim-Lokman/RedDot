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
        child: transactions.isEmpty 
        ? 
        Column(
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
              height: 200,
              child: Image.asset(
                'assets/images/waiting.png', 
                fit: BoxFit.cover,
                ),
            )
          ],
        )
        : ListView.builder(
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
                                color: Theme.of(context).primaryColor,
                              ),
                              )
                          ],
                        ),
                        Container(
                          width: 110,
                          padding: EdgeInsets.all(12),
                          margin: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            border: Border.all(
                              width: 2,
                              color: Theme.of(context).accentColor,
                              )
                          ),
                          child: Text(
                            "\$ ${transactions[index].amount.toStringAsFixed(2)}",
                            style: TextStyle(
                              color: Colors.white,
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