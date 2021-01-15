import 'package:cloud_firestore/cloud_firestore.dart';

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
}
