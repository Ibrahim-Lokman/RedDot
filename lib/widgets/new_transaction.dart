import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class NewTransaction extends StatefulWidget {

  final Function addTx;
  NewTransaction(this.addTx);

  @override
  State<NewTransaction>  createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.parse('0000-00-00');

  void _submitData(){
    if (_amountController.text.isEmpty){
        return;
    }
    final entererdTiltle = _titleController.text;
    final entererdAmount = double.parse(_amountController.text);
    
    if(entererdTiltle.isEmpty || entererdAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(
       entererdTiltle, 
       entererdAmount,
       _selectedDate,
    );
    
    //close/pop the topmost widget
    Navigator.of(context).pop();
  }

  void _presentDatePicker(){
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2019), 
      lastDate: DateTime.now(),
    ).then((pickedDate) {
       if(pickedDate == null) {
        return;
       }
       setState(() {
          _selectedDate = pickedDate;
       });
    });
    print('...');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.only(
                  top: 10,
                  right: 10,
                  left: 10,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: _titleController,
                      onSubmitted: (_) => _submitData(),
                      //onChanged: (value){},
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      controller: _amountController,
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      onSubmitted: (_) => _submitData(),
                      //onChanged: (value){},
                      
                    ),
    
                    Container(
                      height: 75,
                      child: Row(
                        children: <Widget>[
                        Expanded(
                          child: Text(_selectedDate == DateTime.parse('0000-00-00')
                                ? 'No Date Chosen'
                                : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}'
                                ),
                        ),
                        TextButton(
                           onPressed: _presentDatePicker,
                           style: TextButton.styleFrom(
                                foregroundColor: Colors.pink,
                               ),
                           child: Text('Choose Date',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      ),
                                    
                                     ),
                        ),
                      ],),
                    ),
    
                    TextButton(
                         onPressed: _submitData,
                         style: TextButton.styleFrom(
                              foregroundColor: Colors.pink,
                             ),
                         child: Text('Add Transaction',
                                  style: TextStyle(fontSize: 20),
                                   ),   
                      ),
                  ],
                ),
              ),
            ),
    );
  }
}