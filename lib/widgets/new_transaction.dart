import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
class NewTransaction extends StatelessWidget {

  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    controller: titleController,
                    //onChanged: (value){},
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    controller: amountController,
                    //onChanged: (value){},
                    
                  ),
                    TextButton(

                       onPressed: () {
                        addTx(titleController.text, double.parse(amountController.text));
                       },
                       style: TextButton.styleFrom(
                            foregroundColor: Colors.pink,
                          //  backgroundColor: Color.fromARGB(255, 154, 209, 200),
                           ),
                       child: Text('Add Transaction',
                                style: TextStyle(fontSize: 20),
                                 ),
                    ),
                ],
              ),
            ),
          );
  }
}