import 'package:flutter/material.dart';
import 'package:htn2020project/pages/add_task.dart';
import 'package:htn2020project/pages/task_list.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => TaskList(),
    '/addtask': (context) => AddTask()
  },
));
