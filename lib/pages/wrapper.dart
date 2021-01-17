import 'package:flutter/material.dart';
import 'package:htn2020project/models/user.dart';
import 'package:htn2020project/pages/authenticate/authenticate.dart';
import 'package:htn2020project/pages/task_list.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    
    //home or authenticate
    if (user == null) {
      return Authenticate();
    } else {
      return TaskList();
    }
  }
}