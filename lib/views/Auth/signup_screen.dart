import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:tyrex/views/Auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:tyrex/views/Auth/widgets/button.dart';
import 'package:tyrex/views/Auth/widgets/textfield.dart';
import 'package:progress_dialog/progress_dialog.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _name = TextEditingController();
  final _address = TextEditingController();
  final _phone = TextEditingController();
  final _bikename = TextEditingController();
  final _model = TextEditingController();
  final _regNo = TextEditingController();
  final _password = TextEditingController();

  String _errorTxt = '';
  String _errorEmail = '';
  String _errorPhone = '';
  ProgressDialog pr;

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

    return Scaffold(
      backgroundColor: Colors.yellow,
      resizeToAvoidBottomPadding: false, // this avoids the overflow error
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
          child: Container(
        height: MediaQuery.of(context).size.height,
        child: Container(
          // color: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 20),
          margin: EdgeInsets.only(top: screenheight / 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: screenheight / 20),
              CustomTextFieldTwo(
                controller: _name,
                hintTxt: 'Full name',
                isPassword: true,
              ),
              SizedBox(height: screenheight / 50),
              CustomTextFieldTwo(
                controller: _address,
                hintTxt: 'Address',
                isPassword: true,
              ),
              SizedBox(height: screenheight / 50),
               CustomTextFieldTwo(
                controller: _phone,
                hintTxt: 'Mobile',
                isPassword: true,
              ),
              SizedBox(height: screenheight / 50),
               CustomTextFieldTwo(
                controller: _bikename,
                hintTxt: 'Bike Name',
                isPassword: true,
              ),
              SizedBox(height: screenheight / 50),
               CustomTextFieldTwo(
                controller: _model,
                hintTxt: 'Bike Model',
                isPassword: true,
              ),
              SizedBox(height: screenheight / 50),
               CustomTextFieldTwo(
                controller: _regNo,
                hintTxt: 'Register No',
                isPassword: true,
              ),
              SizedBox(height: screenheight / 50),
               CustomTextFieldTwo(
                controller: _password,
                hintTxt: 'Password',
                isPassword: true,
              ),
              SizedBox(height: screenheight / 50),
              Text("By clicking sign up, you agree to our terms and data policy. You may receive SMS notifications from us and can opt.Out at anytime",
                     style: TextStyle(
              fontSize: 15,  fontWeight: FontWeight.w800)
                    ),
                    SizedBox(height: screenheight / 50),
              GestureDetector(
                onTap: () {
                  if (validate()) {}
                },
                child: Button(
                  text: "Sign up",
                  color: Colors.black,
                  btnTxtColor: Colors.white,
                  height: screenheight / 15,
                  width: screenwidth / 9,
                ),
              ),
            ],
          ),
        ),
      )),
    );
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
    if (_phone.text.isEmpty &&
        _address.text.isEmpty &&
        _name.text.isEmpty &&
        _bikename.text.isEmpty &&
        _model.text.isEmpty &&
        _regNo.text.isEmpty &&
        _password.text.isEmpty) {
      errorDialog('ERROR', 'Fields cant be empty !');

      return false;
    } else if (_phone.text.isEmpty ||
        _address.text.isEmpty ||
        _name.text.isEmpty ||
        _bikename.text.isEmpty ||
        _model.text.isEmpty ||
        _regNo.text.isEmpty ||
        _password.text.isEmpty) {
      errorDialog('ERROR', 'Fields cant be empty !');
      return false;
    } else if (_phone.text.length <= 9) {
      errorDialog('ERROR', 'phone no should long 10 digits !');

      return false;
    }
   else{

     return true;
   }
  }
}
