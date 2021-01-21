import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tyrex/models/user.dart';
import 'package:tyrex/srevices/authentication.dart';
import 'package:tyrex/views/Auth/login_screen.dart';
import 'package:tyrex/views/Auth/widgets/button.dart';
import 'package:tyrex/views/mp_screens/about_us.dart';
import 'package:tyrex/views/mp_screens/book_service/book_service.dart';
import 'package:tyrex/views/mp_screens/book_service/booking_history.dart';
import 'package:tyrex/views/mp_screens/contact_us.dart';
import 'package:tyrex/views/mp_screens/profile/profile.dart';
import 'package:tyrex/views/mp_screens/spare_parts/order_history.dart';
import 'package:tyrex/views/mp_screens/spare_parts/spareparts_order.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
     final user = Provider.of<User>(context);
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.yellow,
      drawer: Drawer(
          child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.black),
            accountName: Text("Damindu Nehan"),
            accountEmail: Text("0772331121"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.orange,
              child: Text(
                "D",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(leading: Icon(Icons.home), title: Text("Home")),
          ListTile(
            leading: Icon(Icons.person_pin),
            title: Text("My profile"),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyProfile()));
            },
          ),
          ListTile(leading: Icon(Icons.list), title: Text("Orders"),onTap: (){
            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SparePartsOrder()));
          }),
           ListTile(leading: Icon(Icons.list), title: Text("Services"),onTap: (){
            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => BookingScreen()));
          }),
          ListTile(leading: Icon(Icons.payment), title: Text("Orders History"),onTap: (){
            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => OrderHistory()));
          }),
          ListTile(leading: Icon(Icons.contacts), title: Text("Contact Us"),onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ContactUs()));
            },),
          ListTile(
            leading: Icon(Icons.emoji_emotions),
            title: Text("About Us"),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AboutUs()));
            },
          ),
          ListTile(leading: Icon(Icons.logout), title: Text("Logout"), onTap: () async {
             await _auth.signOut();

              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LoginScreen()));
            },),
        ],
      )),
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenheight / 20),
              Text("Easy pick up & drop",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      color: Colors.white)),
              SizedBox(height: screenheight / 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildTile('assets/images/p1.png', "Book Service", () {
                     Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => BookingScreen()));
                  }),
                  buildTile('assets/images/p2.png', "Free Pickup", () {
                    print("dsfsdf");
                  })
                ],
              ),
              SizedBox(height: screenheight / 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildTile('assets/images/p3.png', "Detailed Checkup", () {
                    print("dsfsdf");
                  }),
                  buildTile('assets/images/p4.png', "Spare Parts Order", () {
                     Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SparePartsOrder()));
                  })
                ],
              ),
              SizedBox(height: screenheight / 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildTile('assets/images/p5.png', "Track Bike", () {
                    print("dsfsdf");
                  }),
                  buildTile('assets/images/p6.png', "Bill Service", () {
                    print("dsfsdf");
                  })
                ],
              ),
              SizedBox(height: screenheight / 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildTile('assets/images/p7.png', "Booking History", () {
                   Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => BookingHistory(uid: user.uid)));
                  }),
                  buildTile('assets/images/p8.png', "Order History", () {
                     Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => OrderHistory()));
                  })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTile(String imgPath, String btnName, Function function) {
    return Column(
      children: [
        Image.asset(
          imgPath,
          width: MediaQuery.of(context).size.width / 4,
          height: MediaQuery.of(context).size.height / 11,
        ),
        GestureDetector(
          onTap: function,
          child: ButtonTwo(
            text: btnName,
            color: Colors.black,
            btnTxtColor: Colors.white,
            fontsize: 12,
            height: MediaQuery.of(context).size.height / 18,
            width: MediaQuery.of(context).size.width / 14,
          ),
        ),
      ],
    );
  }
}
