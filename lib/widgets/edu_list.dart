import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class NewEducation extends StatefulWidget {

  final Function addNewEdu;
  NewEducation(this.addNewEdu);

  @override
  State<NewEducation>  createState() => _NewEducationState();
}

class _NewEducationState extends State<NewEducation> {
  final _EduTitleController = TextEditingController();
  final _PassingYearController = TextEditingController();


  void _submitData(){
    if (_PassingYearController.text.isEmpty){
        return;
    }
    final entererdTiltle = _EduTitleController.text;
    final entererdYear = int.parse(_PassingYearController.text);
    
    if(entererdTiltle.isEmpty || entererdYear  <= 0) {
      return;
    }

    widget.addNewEdu(
       entererdTiltle, 
       entererdYear,
    );
    
    //close/pop the topmost widget
   // Navigator.of(context).pop();
  }


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
                    decoration: InputDecoration(labelText: 'Degree Title'),
                    controller: _EduTitleController,
                    onSubmitted: (_) => _submitData(),
                    //onChanged: (value){},
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Passing Year'),
                    controller: _PassingYearController,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    onSubmitted: (_) => _submitData(),
                    //onChanged: (value){},
                    
                  ),           

                  TextButton(
                       onPressed: _submitData,
                       style: TextButton.styleFrom(
                            foregroundColor: Colors.pink,
                           ),
                       child: Text('Add Record',
                                style: TextStyle(fontSize: 20),
                                 ),   
                    ),
                ],
              ),
            ),
          );
  }
}