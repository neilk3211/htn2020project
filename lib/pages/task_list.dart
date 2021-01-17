
import 'package:flutter/material.dart';
import 'package:htn2020project/models/user.dart';
import 'package:htn2020project/services/auth.dart';
import 'package:htn2020project/services/database.dart';
import 'package:htn2020project/shared/loading.dart';
import 'package:provider/provider.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<dynamic> tasknames = [
    Tasks(url: 'Europe/London', taskname: 'English project', remainingtime: 3600),
    Tasks(url: 'Europe/Berlin', taskname: 'Math project', remainingtime: 3600),
    Tasks(url: 'Africa/Cairo', taskname: 'Science project', remainingtime: 7200),
    Tasks(url: 'Africa/Nairobi', taskname: 'Geography project', remainingtime: 2400),
  ];
  
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    User user = Provider.of<User>(context);
    /*return  StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
        UserData userData = snapshot.data;
        tasknames = userData.tasks;*/
        return StreamBuilder<UserData>(
                  stream: DatabaseService(uid: user.uid).userData,
                  builder: (context, snapshot) {
                    
                    if (!snapshot.hasData) {
                      return Loading();
                    }
                    tasknames = snapshot.data.tasks.map((val) => Tasks(remainingtime: val['remainingtime'], taskname: val['taskname'], complete: val['complete'] ?? false)).toList();
            return Scaffold(
              backgroundColor: Colors.grey[200],
              appBar: AppBar(
                backgroundColor: Colors.blue[900],
                title: Text('My Tasks'),
                centerTitle: true,
                elevation: 0,
                actions: [
                  FlatButton.icon(onPressed: () async {
                    await _auth.signOut();
                  },
                  icon: Icon(Icons.person), 
                  label: Text('logout')),
                ],
=======
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Row(
            children: [
              Text('My Tasks'),
              SizedBox(width: 100,),
              FlatButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/completedlist');
                },
                icon: Icon(Icons.check,
                  color: Colors.grey[100],
                ),
                label: Text('Completed Tasks',
                  style: TextStyle(
                    color: Colors.grey[100],
                    fontSize: 14,
                  ),
                ),
                color: Colors.blue[800],
              ),
            ],
          ),
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
                    tasknames.add(Tasks(taskname: newtask['taskname'], remainingtime: newtask['duration']));
                  });
                },
                heroTag: null,
>>>>>>> 3de7d7a670062efe256f97be5f17a8b5c545da6f
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
                        tasknames.add(Tasks(taskname: newtask['taskname'], remainingtime: (newtask['duration']).round()));
                        print(tasknames.toString());
                        setState(() async {
                          await DatabaseService(uid: user.uid).updateUserData(tasknames.map((val) => {'taskname': val.taskname, 
                                  'remainingtime': val.remainingtime.round(), 'complete': val.complete}).toList());
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
                              tasknames[index].complete = true;
                              setState(() {
                                
                               
                              });
                            } else {
                               
                              setState(() {  
                                tasknames[index].remainingtime = tasknames[index].remainingtime - (result['returnedhour']*3600 + result['returnedminute']*60 + result['returnedsecond']).round();
                              });
                              if (tasknames[index].remainingtime <= 0) {
                                setState(() {
                                  tasknames[index].complete = true;
                                  tasknames[index].remainingtime = 0;
                                  
                                });
                              }
                            }
                            dynamic stuff = tasknames.map((val) => {'taskname': val.taskname, 'remainingtime': val.remainingtime.round(), 'complete': val.complete}).toList();
                            DatabaseService(uid: user.uid).updateUserData(stuff);

                          },
                          // taskname - h:min:s
                          title: Text('${tasknames[index].taskname} - ${(tasknames[index].remainingtime / 3600.0).truncate()}:${(tasknames[index].remainingtime % 3600.0 / 60.0).truncate()}:${(tasknames[index].remainingtime % 3600.0 % 60.0).truncate()}'),
                          leading: Icon(tasknames[index].complete ? Icons.check : Icons.clear_sharp),
                        ),
                      ),
                    );
                  }
              )
          ); 
        });
}

}