import 'package:flutter/material.dart';
import 'package:tyrex/views/Auth/widgets/button.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.yellow,
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
                    print("dsfsdf");
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
                    print("dsfsdf");
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
                  buildTile('assets/images/p7.png', "Payment Order", () {
                    print("dsfsdf");
                  }),
                  buildTile('assets/images/p8.png', "Free drop", () {
                    print("dsfsdf");
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
