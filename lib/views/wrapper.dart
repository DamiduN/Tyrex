import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tyrex/models/user.dart';
import 'package:tyrex/views/Auth/login_screen.dart';
import 'package:tyrex/views/mp_screens/home_screen/home_screen.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final user = Provider.of<User>(context);
    print(user); 
    if(user== null){
       return LoginScreen();
    }else{
      return HomeScreen();
    }
    
  }
}