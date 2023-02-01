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
               margin: EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 5
                ),
               child: ListTile(
                leading: CircleAvatar(
                  radius: 30, 
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: FittedBox(
                      child: Text('\$${transactions[index].amount}')
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title, 
                      style: Theme.of(context).textTheme.titleMedium
                      ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                      ),
                  ),
             );
              },


            ),
           );
  }
}