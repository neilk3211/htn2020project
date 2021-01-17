import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:htn2020project/models/user.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});
  //collection reference
  final CollectionReference userCollection = Firestore.instance.collection('users');

  Future updateUserData(tasks) async {
    print(tasks.toString());
    return await userCollection.document(uid).setData({
      'tasks': tasks,
    });
  }


  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    print(snapshot.data);
    return UserData(
      uid: uid,
      tasks: snapshot.data['tasks']
    );
  }
  

  //get user data stream
  Stream<UserData> get userData {
    return userCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}

 