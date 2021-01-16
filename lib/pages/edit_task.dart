import 'package:flutter/material.dart';

class EditTask extends StatefulWidget {
  @override
  _EditTaskState createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text('taskname',
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
                Navigator.pop(context, {
                  'completed' : true,
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
                Navigator.pop(context, {
                  'delete': true,
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