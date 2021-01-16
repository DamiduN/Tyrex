import 'package:provider/provider.dart';
import 'package:tyrex/models/user.dart';
import 'package:tyrex/views/Auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:tyrex/views/wrapper.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    
    initializeAuth();
  }

  void initializeAuth() {
    Future.delayed(Duration(seconds: 6), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Wrapper()),
          (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/logosecond.png',
              width: 250,
              height: 100,
            ),
          ),
          Text(
            "Tyrex",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
