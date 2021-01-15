import 'package:flutter/material.dart';

class BookingHistory extends StatefulWidget {
  BookingHistory({Key key}) : super(key: key);

  @override
  _BookingHistoryState createState() => _BookingHistoryState();
}

class _BookingHistoryState extends State<BookingHistory> {
  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: screenheight / 30),
              Text("Booking History",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: Colors.black)),
              SizedBox(height: screenheight / 30),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: screenwidth,
                color: Colors.black,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Service type - ...............",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Colors.white)),
                    SizedBox(height: screenheight / 40),
                    Text("Full total - .............",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Colors.white)),
                    SizedBox(height: screenheight / 40),
                    // Text("Registration no - ..............",
                    //     textAlign: TextAlign.left,
                    //     style: TextStyle(
                    //         fontSize: 18,
                    //         fontWeight: FontWeight.w900,
                    //         color: Colors.white)),
                  ],
                ),
              ),
                Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                width: screenwidth,
                color: Colors.black,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Service type - ...............",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Colors.white)),
                    SizedBox(height: screenheight / 40),
                    Text("Full total - .............",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Colors.white)),
                    SizedBox(height: screenheight / 40),
                    // Text("Registration no - ..............",
                    //     textAlign: TextAlign.left,
                    //     style: TextStyle(
                    //         fontSize: 18,
                    //         fontWeight: FontWeight.w900,
                    //         color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
