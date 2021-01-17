import 'package:flutter/material.dart';

class CompletedList extends StatefulWidget {
  @override
  _CompletedListState createState() => _CompletedListState();
}

class _CompletedListState extends State<CompletedList> {
  List<Tasks> tasknames = [
    Tasks(url: 'Europe/London', taskname: 'English project', remainingtime: 3600),
    Tasks(url: 'Europe/Berlin', taskname: 'Math project', remainingtime: 3600),
    Tasks(url: 'Africa/Cairo', taskname: 'Science project', remainingtime: 7200),
    Tasks(url: 'Africa/Nairobi', taskname: 'Geography project', remainingtime: 2400),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Completed Tasks'),
        backgroundColor: Colors.blue[900],
      ),
    );
  }
}

class Tasks {

  String taskname; // task name for UI
  String url; // task url for api endpoint - no function at the moment
  double remainingtime; //in seconds
  bool complete = false;

  Tasks({ this.taskname, this.url, this.remainingtime });

}
