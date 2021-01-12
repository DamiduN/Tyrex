import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:tyrex/views/Auth/reset_password.dart';
import 'package:tyrex/views/Auth/signup_screen.dart';
import 'package:tyrex/views/Auth/widgets/button.dart';
import 'package:tyrex/views/Auth/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phone = TextEditingController();
  final _password = TextEditingController();
  String _errorTxt = '';
  ProgressDialog pr;

  Future<bool> _onBackPressed() {
    return AwesomeDialog(
            context: context,
            dialogType: DialogType.WARNING,
            // customHeader: Image.asset("assets/images/macha.gif"),
            animType: AnimType.TOPSLIDE,
            btnOkText: "yes",
            btnCancelText: "No..",
            tittle: 'Are you sure ?',
            desc: 'Do you want to exit an App',
            btnCancelOnPress: () {},
            btnOkOnPress: () {
              exit(0);
            }).show() ??
        false;
  }

  @override
  void dispose() {
    _phone.dispose();
    _errorTxt = "";
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    pr = new ProgressDialog(context, type: ProgressDialogType.Normal);

    pr.style(
        message: 'Verifying Phone...',
        borderRadius: 10.0,
        progressWidget: Container(
          height: 30,
          width: 30,
          child: CircularProgressIndicator(),
        ),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progressTextStyle: TextStyle(fontFamily: 'Montserrat'));

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        backgroundColor: Colors.yellow,
        resizeToAvoidBottomPadding: false, // this avoids the overflow error
        resizeToAvoidBottomInset: true,
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 7,
                  decoration: BoxDecoration(
                      borderRadius: new BorderRadius.circular(8.0),
                      image: DecorationImage(
                          image: AssetImage('assets/images/w3.png'),
                          fit: BoxFit.contain)),
                ),
                Container(
                  // color: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  margin: EdgeInsets.only(top: screenheight / 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CustomTextField(
                        imgpath: 'assets/images/phone.png',
                        controller: _phone,
                        hintTxt: 'Mobile no',
                        isPassword: false,
                      ),
                      SizedBox(height: screenheight / 20),
                      CustomTextField(
                        imgpath: 'assets/images/lock.png',
                        controller: _password,
                        hintTxt: 'Password',
                        isPassword: true,
                      ),
                      SizedBox(height: screenheight / 30),
                      GestureDetector(
                        onTap: () {
                          if (validate()) {}
                        },
                        child: Button(
                          text: "Sign in",
                          color: Colors.black,
                          btnTxtColor: Colors.white,
                          height: screenheight / 14,
                          width: screenwidth / 9,
                        ),
                      ),
                      SizedBox(height: screenheight / 30),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ResetPassword()));
                        },
                        child: Button(
                          text: "Forgot Password ?",
                          color: Colors.white,
                          btnTxtColor: Colors.black,
                          height: screenheight / 15,
                          width: screenwidth / 9,
                        ),
                      ),
                      SizedBox(height: screenheight / 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Dont have an account ?",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500)),
                          SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SignupScreen()));
                            },
                            child: Button(
                              text: "Sign up",
                              color: Colors.black,
                              btnTxtColor: Colors.white,
                              height: screenheight / 14,
                              width: screenwidth / 9,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> successDialog(String title, String dec) {
    return AwesomeDialog(
            context: context,
            dialogType: DialogType.SUCCES,
            animType: AnimType.TOPSLIDE,
            tittle: title,
            desc: dec,
            btnOkText: 'Ok',
            btnCancelText: 'Cancel',
            btnCancelOnPress: () {},
            btnOkOnPress: () {})
        .show();
  }

  Future<dynamic> errorDialog(String title, String dec) {
    return AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.TOPSLIDE,
            tittle: title,
            desc: dec,
            // btnCancelOnPress: () {},
            btnOkOnPress: () {})
        .show();
  }

  bool validate() {
    if (_phone.text == '' && _password.text == '') {
      errorDialog('ERROR', 'Fields cant be empty !');

      return false;
    } else if (_phone.text.length <= 9) {
      errorDialog('ERROR', 'Mobile no should long 10 digits !');

      return false;
    } else if (_phone.text == '' || _password.text == '') {
      errorDialog('ERROR', 'Fields cant be empty !');

      return false;
    } else if (_phone.text != '' && _password.text != '') {
      print("valid 4n number");
      return true;
    }
  }
}
