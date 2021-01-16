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
          title: Text('My Tasks'),
          centerTitle: true,
          elevation: 0,
        ),
        floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                child: Icon(
                    Icons.add
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/addtask');
                },
                heroTag: null,
              ),
              SizedBox(
                height: 10,
              ),
              FloatingActionButton(
                child: Icon(
                    Icons.calendar_today
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/calendar');
                },
                heroTag: null,
              )
            ]
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
                    leading: Icon(tasknames[index].complete ? Icons.check : Icons.clear_sharp),
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