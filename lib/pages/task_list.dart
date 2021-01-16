import 'package:flutter/material.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Tasks> tasknames = [
    Tasks(url: 'Europe/London', taskname: 'English project'),
    Tasks(url: 'Europe/Berlin', taskname: 'Math project'),
    Tasks(url: 'Africa/Cairo', taskname: 'Science project'),
    Tasks(url: 'Africa/Nairobi', taskname: 'Geography project'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Your Tasks'),
          centerTitle: true,
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                Navigator.pushNamed(context, '/addtask');
              });
            },
            child: Icon(Icons.add),
            backgroundColor: Colors.grey[800]
        ),
        body: ListView.builder(
            itemCount: tasknames.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal:4.0),
                child: Card(
                  child:ListTile(
                    onTap: () async {
                      print(tasknames[index].taskname);
                      dynamic result = await Navigator.pushNamed(context, '/edittask', arguments: { 'taskname' : tasknames[index].taskname });
                      if (result['delete']) {
                        setState(() {
                          tasknames.removeAt(index);
                        });
                      } else if (result['completed']) {
                        setState(() {
                          tasknames[index].complete = true;
                        });
                      }
                    },
                    title: Text(tasknames[index].taskname),
                    leading: CircleAvatar(backgroundColor: tasknames[index].complete ? Colors.green : Colors.red),
                  ),
                ),
              );
            }
        )
    );
  }
}

class Tasks {

  String taskname; // task name for UI
  String url; // task url for api endpoint
  bool complete = false;

  Tasks({ this.taskname, this.url });

}