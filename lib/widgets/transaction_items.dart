import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItems extends StatelessWidget {
  const TransactionItems({
    Key? key,
    required this.transaction,
    required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
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
             child: Text('\$${transaction.amount}')
               ),
             ),
           ),
           title: Text(
             transaction.title, 
             style: Theme.of(context).textTheme.titleMedium
             ),
           subtitle: Text(
             DateFormat.yMMMd().format(transaction.date),
             ),
           trailing: 
           MediaQuery.of(context).size.width > 400
           ?
           TextButton.icon(
             icon : Icon(Icons.delete),
             onPressed: () => deleteTx(transaction.id),
             style: TextButton.styleFrom(
             foregroundColor: Colors.pink,
            ),
             label: Text("Delete"),
           )
           :
           IconButton( 
             icon: Icon(Icons.delete),
             color: Theme.of(context).errorColor,
             onPressed: () => deleteTx(transaction.id),
             ),
         ),
    );
  }
}