import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key key}) : super(key: key);

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
              Text("About us",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: Colors.white)),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Tyrex is a bike servicing station located at the heart of Colombo. We offer 24 hours service with free pick up and drop ensuring convenience to our customers.All our service are brought to you by our professional mechanics. You can make an appointment over the phone or online.",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(height: 20),
              Image.asset(
              'assets/images/logofirst.png',
              width: 250,
              height: 100,
            ),
            ],
          ),
        ),
      ),
    );
  }
}
