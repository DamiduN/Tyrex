import 'package:flutter/material.dart';

class View extends StatelessWidget {
  const View({Key key}) : super(key: key);

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
              Text("View 1",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.black)),
              Image.asset(
                'assets/images/licence1.jpeg',
                width: MediaQuery.of(context).size.width / 1.3,
                height: MediaQuery.of(context).size.height / 4,
                fit: BoxFit.fill,
              ),
               SizedBox(height: MediaQuery.of(context).size .height / 20),
              Text("View 2",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.black)),
              Image.asset(
                'assets/images/licence2.jpeg',
                width: MediaQuery.of(context).size.width / 1.3,
                height: MediaQuery.of(context).size.height / 4,
                fit: BoxFit.fill,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
