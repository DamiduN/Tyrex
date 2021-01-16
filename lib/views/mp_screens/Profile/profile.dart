import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tyrex/models/user.dart';
import 'package:tyrex/srevices/database.dart';
import 'package:tyrex/utils/loading.dart';
import 'package:tyrex/views/Auth/widgets/button.dart';
import 'package:tyrex/views/mp_screens/profile/edit_profile.dart';
import 'package:tyrex/views/mp_screens/profile/view.dart';

class MyProfile extends StatefulWidget {
  MyProfile({Key key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    final user = Provider.of<User>(context);
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: StreamBuilder<UserData>(
          stream: DatabaseService(uid: user.uid).userData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              UserData userData = snapshot.data;

              return Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: screenheight / 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 40),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/profile.png',
                                width: MediaQuery.of(context).size.width / 3,
                                height: MediaQuery.of(context).size.height / 9,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => EditProfile(
                                            uid: userData.uid,
                                            name: userData.name,
                                            address: userData.address,
                                            email: userData.email,
                                            bikename: userData.bikename,
                                            bikemodel: userData.bikemodel,
                                            regno: userData.regno,
                                            password: userData.password,
                                          )));
                                },
                                child: ButtonTwo(
                                  text: "Edit Profile",
                                  color: Colors.white,
                                  btnTxtColor: Colors.black,
                                  fontsize: 12,
                                  height:
                                      MediaQuery.of(context).size.height / 20,
                                  width: MediaQuery.of(context).size.width / 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("${userData.name}",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black)),
                            Text("${userData.email}",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black)),
                            Text("${userData.regno}",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black)),
                            Padding(
                              padding: const EdgeInsets.only(left: 80),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => View()));
                                },
                                child: ButtonTwo(
                                  text: "View",
                                  color: Colors.white,
                                  btnTxtColor: Colors.black,
                                  fontsize: 12,
                                  height:
                                      MediaQuery.of(context).size.height / 24,
                                  width: MediaQuery.of(context).size.width / 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text("My bike details",
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w900,
                            color: Colors.white)),
                    SizedBox(height: screenheight / 30),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      width: screenwidth,
                      color: Colors.black,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Bike Name - ${userData.bikename}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white)),
                          SizedBox(height: screenheight / 40),
                          Text("Model - ${userData.bikemodel}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white)),
                          SizedBox(height: screenheight / 40),
                          Text("Registration no - ${userData.regno}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white)),
                        ],
                      ),
                    ),
                    // Padding(
                    //   padding:
                    //       EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                    //   child: GestureDetector(
                    //     onTap: () {},
                    //     child: ButtonTwo(
                    //       text: "Review",
                    //       color: Colors.white,
                    //       btnTxtColor: Colors.black,
                    //       fontsize: 12,
                    //       height: MediaQuery.of(context).size.height / 20,
                    //       width: MediaQuery.of(context).size.width / 16,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              );
            } else {
              return Loading();
            }
          }),
    );
  }
}
