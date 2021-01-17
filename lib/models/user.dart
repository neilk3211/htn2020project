

class User {
  final String uid;

  User({this.uid});
}

class UserData {

  final String uid;
  final tasks;

  UserData({ this.uid, this.tasks });
}
class Tasks {

  String taskname; // task name for UI
  String url; // task url for api endpoint - no function at the moment
  int remainingtime; //in seconds
  bool complete = false;

  Tasks({ this.taskname, this.url, this.remainingtime, this.complete });

}