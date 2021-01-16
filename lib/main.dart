import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tyrex/models/user.dart';
import 'package:tyrex/srevices/authentication.dart';
import 'package:tyrex/views/splash_screen/splash_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthService().user,
          child: MaterialApp(
        title: 'Tyrex',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
