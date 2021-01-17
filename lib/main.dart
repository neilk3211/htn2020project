import 'package:flutter/material.dart';
import 'package:htn2020project/pages/add_task.dart';
import 'package:htn2020project/pages/calendar.dart';
import 'package:htn2020project/pages/edit_task.dart';
import 'package:htn2020project/pages/task_list.dart';
<<<<<<< HEAD
import 'package:htn2020project/pages/wrapper.dart';
import 'package:htn2020project/services/auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
  value: AuthService().user,
  child:   MaterialApp(
      home: Wrapper(),
   routes: {
      '/addtask': (context) => AddTask(),
      '/edittask': (context) => EditTask(),
      '/calendar': (context) => Calendar(),
      },
  ),
      );
  }
}
=======
import 'package:htn2020project/pages/completed_list.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => TaskList(),
    '/addtask': (context) => AddTask(),
    '/edittask': (context) => EditTask(),
    '/calendar': (context) => Calendar(),
    '/completedlist': (context) => CompletedList(),
  },
));
>>>>>>> 3de7d7a670062efe256f97be5f17a8b5c545da6f
