import 'package:flutter/material.dart';
import 'package:htn2020project/pages/add_task.dart';
import 'package:htn2020project/pages/calendar.dart';
import 'package:htn2020project/pages/edit_task.dart';
import 'package:htn2020project/pages/task_list.dart';
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