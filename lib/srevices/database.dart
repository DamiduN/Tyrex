import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tyrex/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  final CollectionReference bookingCollection =
      Firestore.instance.collection('bookings');

  final CollectionReference orderCollection =
      Firestore.instance.collection('orders');

  Future saveUserData(String name, String address, String email,
      String bikename, String bikemodel, String regNo) async {
    return await userCollection.document(uid).setData({
      'name': name,
      'address': address,
      'email': email,
      'bikename': bikename,
      'bikemodel': bikemodel,
      'regno': regNo
    });
  }

  Future save(String password) async {
    return await userCollection.document(uid).setData({'password': password});
  }

  //save a booking
  Future saveBooking(
      String type,
      bool oil,
      bool filters,
      bool normalwash,
      bool highwash,
      bool repairdamage,
      bool freepickup,
      bool freedrop,
      double tot,
      String paymenttype) async {
    return await bookingCollection.add({
      'uid': uid,
      'servicetype': type,
      'oil': oil,
      'filters': filters,
      'normalwash': normalwash,
      'repairdamage': repairdamage,
      'highwash': highwash,
      'freepickup': freepickup,
      'freedrop': freedrop,
      'total': tot,
      'paymenttype': paymenttype
    });
  }

  //save a booking
  Future saveOrder(
      bool buzzer,
      bool crashGuard,
      bool engineGuard,
      bool frontLinear,
      bool gearLeaver,
      bool handGrip,
      bool helmetLock,
      bool helmet,
      bool numberPlateCover,
      bool pillionHolder,
      bool seatCover,
      bool tankCover,
      bool breakpads,
      bool signallightCup,
      bool headligth,
      double tot,
      String paymenttype) async {
    return await orderCollection.add({
      'uid': uid,
      'buzzer': buzzer,
      'crashGuard': crashGuard,
      'engineGuard': engineGuard,
      'frontLinear': frontLinear,
      'gearLeaver': gearLeaver,
      'handGrip': handGrip,
      'helmetLock': helmetLock,
      'helmet': helmet,
      'numberPlateCover': numberPlateCover,
      'pillionHolder': pillionHolder,
      'seatCover': seatCover,
      'tankCover': tankCover,
      'breakpads': breakpads,
      'signallightCup': signallightCup,
      'headligth': headligth,
      'total': tot,
      'paymenttype': paymenttype
    });
  }

  Stream<QuerySnapshot> get bookings {
    return bookingCollection.snapshots();
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
