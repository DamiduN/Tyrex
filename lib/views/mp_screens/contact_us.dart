import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Contact us",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: Colors.white)),
              Image.asset(
                'assets/images/location.png',
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height / 12,
              ),
              Text(
                "No : 355/3",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
              Text(
                "Alenxandra Lane",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
              Text(
                "Colombo 07",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
              Image.asset(
                'assets/images/phone.png',
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height / 12,
              ),
              Text(
                "+94 11 4600 222",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
              Image.asset(
                'assets/images/email.png',
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height / 12,
              ),
              Text(
                "tyrex@gmail.com",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
