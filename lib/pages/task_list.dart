import 'package:flutter/material.dart';
import 'package:htn2020project/pages/edit_task.dart' as edit_task;

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Tasks> tasknames = [
    Tasks(url: 'Europe/London', taskname: 'English project', remainingtime: 3600),
    Tasks(url: 'Europe/Berlin', taskname: 'Math project', remainingtime: 3600),
    Tasks(url: 'Africa/Cairo', taskname: 'Science project', remainingtime: 7200),
    Tasks(url: 'Africa/Nairobi', taskname: 'Geography project', remainingtime: 2400),
  ];

  int hourlogged = 0;
  int minutelogged = 0;
  int secondlogged = 0;

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
                onPressed:  () async {
                  dynamic newtask = await Navigator.pushNamed(context, '/addtask');
                  setState(() {
                    tasknames.add(Tasks(taskname: newtask['taskname']));
                  });
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
                    title: Text('${tasknames[index].taskname} - ${tasknames[index].remainingtime}'),
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
  String url; // task url for api endpoint - no function at the moment
  int remainingtime; //in seconds
  bool complete = false;

  Tasks({ this.taskname, this.url, this.remainingtime });

}