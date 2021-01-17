import 'package:flutter/material.dart';

// Create a text controller and use it to retrieve the current value
// of the TextField.
final myController1 = TextEditingController();
final myController2 = TextEditingController();
final myController3 = TextEditingController();

class EditTask extends StatefulWidget {
  @override
  _EditTaskState createState() => _EditTaskState();
}

Map data = {};
class _EditTaskState extends State<EditTask> {
  // @override
  // void dispose() {
  //   // Clean up the controller when the widget is disposed.
  //   myController1.dispose();
  //   myController2.dispose();
  //   myController3.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(data['taskname'],
          style: TextStyle(
            color: Colors.white
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[900],        
      ),
      body: Center(
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Three text fields for logged time input
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    controller: myController1,
                  ),
                ),
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    controller: myController2,
                  ),
                ),
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    controller: myController3,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            FlatButton.icon(
              onPressed: () {
                // action upon button press
              },
              icon: Icon(Icons.timer,
                color: Colors.grey[100],
              ),
              label: Text('Log Time (h min s)',
                style: TextStyle(
                  color: Colors.grey[100],
                  fontSize: 18,
                ),
              ),
              color: Colors.blue[800],
            ),
            SizedBox(height: 30),
            FlatButton.icon(
              onPressed: () {
                Navigator.pop(context, {
                  'completed' : true,
                  'delete': false
                });
              },
              icon: Icon(Icons.check, 
                color: Colors.grey[100],
              ), 
              label: Text('Complete Task',
                style: TextStyle(  
                  color: Colors.grey[100],
                  fontSize: 18,
                ),
              ),
              color: Colors.blue[800],
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