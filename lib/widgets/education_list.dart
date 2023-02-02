import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/education.dart';

class EducationList extends StatelessWidget {

  final List<Education> educations;
  final Function deleteTx;

  EducationList(this.educations, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
        child: educations.isEmpty 
        ? Column(
           children: <Widget>[
            SizedBox(height: 25,),
            
            Text(
              'No Education record added yet!',
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
          itemCount: educations.length,
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

                    padding: EdgeInsets.all(1),
                    child: FittedBox(
                    
                      child: Text('${educations[index].year}')
                        ),
                      ),
                    ),
                title: Text(
                      educations[index].titleEdu, 
                      style: Theme.of(context).textTheme.titleLarge
                      ),
                    trailing: IconButton( 
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => deleteTx(educations[index].id),
                      ),
                  ),
             );
              },


            ),
           );
  }
}