import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tyrex/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  Future saveUserData(String name, String address, String email,
      String bikename, String bikemodel, String regNo, String password) async {
    return await userCollection.document(uid).setData({
      'name': name,
      'address': address,
      'email': email,
      'bikename': bikename,
      'bikemodel': bikemodel,
      'regno': regNo,
      'password': password
    });
  }

   //userdata from snapshot
  UserData _userDataFromSnapeshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.data['name'],
        address: snapshot.data['address'],
        email: snapshot.data['email'],
        bikename: snapshot.data['bikename'],
        bikemodel: snapshot.data['bikemodel'],
        regno: snapshot.data['regno'],
        password: snapshot.data['password']);
  }

  //get user doc stream
  Stream<UserData> get userData {
    return userCollection.document(uid).snapshots().map(_userDataFromSnapeshot);
  }
}
