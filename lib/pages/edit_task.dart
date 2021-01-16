import 'package:flutter/material.dart';

class EditTask extends StatefulWidget {
  @override
  _EditTaskState createState() => _EditTaskState();
}

Map data = {};
class _EditTaskState extends State<EditTask> {
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text(data['taskname'],
          style: TextStyle(
            color: Colors.white
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[800],        
      ),
      body: Center(
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            FlatButton.icon(
              onPressed: () {
                print('ddidddddddddddddddddd');
                Navigator.pop(context, {
                  'completed' : true,
                  'delete': false
                });
              },
              icon: Icon(Icons.check, 
                color: Colors.amber[600],
              ), 
              label: Text('Complete Task',
                style: TextStyle(  
                  color: Colors.amber[600],
                  fontSize: 18,
                ),
              ),
              color: Colors.grey[800],
            ),
            SizedBox(height: 30),
            FlatButton.icon(
              onPressed: (){
                print('delete');
                Navigator.pop(context, {
                  'delete': true,
                  'complete': false,
                });
              },
              icon: Icon(Icons.delete, color: Colors.red), 
              label: Text('delete task',
                style: TextStyle(color: Colors.red)
              ))
          ],
        ),
      ),
    );
  }
}