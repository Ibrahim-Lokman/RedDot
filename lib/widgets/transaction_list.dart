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
                trailing: 
                MediaQuery.of(context).size.width > 400
                ?
                TextButton.icon(
                  icon : Icon(Icons.delete),
                  onPressed: () => deleteTx(transactions[index].id),
                  style: TextButton.styleFrom(
                  foregroundColor: Colors.pink,
                 ),
                  label: Text("Delete"),
                )
                :
                IconButton( 
                  icon: Icon(Icons.delete),
                  color: Theme.of(context).errorColor,
                  onPressed: () => deleteTx(transactions[index].id),
                  ),
              ),
         );
          },


        );
  }
}