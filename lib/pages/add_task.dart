import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: CreateNewTask(),
));

/*testing stuff here
int maxLength = 2;
final bool maxLengthEnforced = true;*/

class CreateNewTask extends StatefulWidget {
  @override
  _CreateNewTaskState createState() => _CreateNewTaskState();
}

class _CreateNewTaskState extends State<CreateNewTask> {
/* testing controller stuff here, don't worry about this for now
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Task'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text(
                'Name of task',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                ),
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Text(
                'Amount of time needed',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(
                      fontSize: 20,
                    ),
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
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
