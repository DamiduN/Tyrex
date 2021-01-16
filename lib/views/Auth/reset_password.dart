import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:provider/provider.dart';
import 'package:tyrex/models/user.dart';
import 'package:tyrex/srevices/database.dart';
import 'package:tyrex/views/Auth/widgets/button.dart';
import 'package:tyrex/views/Auth/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _passwordTwoOne = TextEditingController();
  final _passwordTwo = TextEditingController();

  ProgressDialog pr;

  @override
  void dispose() {
    _passwordTwoOne.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    final user = Provider.of<User>(context);
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                // color: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.only(top: screenheight / 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Reset Password",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                    SizedBox(height: screenheight / 20),
                    CustomTextFieldTwo(
                      controller: _passwordTwoOne,
                      hintTxt: 'New Password',
                      isPassword: true,
                    ),
                    SizedBox(height: screenheight / 20),
                    CustomTextFieldTwo(
                      controller: _passwordTwo,
                      hintTxt: 'Repeat Password',
                      isPassword: true,
                    ),
                    SizedBox(height: screenheight / 20),
                    GestureDetector(
                      onTap: () async {
                        print(user.uid);
                        // if (validate()) {
                        //   await DatabaseService(uid: user.uid)
                        //       .save(_passwordTwo.text);
                        //   Navigator.pop(context);
                        // }
                      },
                      child: Button(
                        text: "Update password",
                        color: Colors.white,
                        btnTxtColor: Colors.black,
                        height: screenheight / 15,
                        width: screenwidth / 9,
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
    if (_passwordTwoOne.text == '' && _passwordTwo.text == '') {
      errorDialog('ERROR', 'Fields cant be empty !');

      return false;
    } else if (_passwordTwoOne.text == '' || _passwordTwo.text == '') {
      errorDialog('ERROR', 'Fields cant be empty !');

      return false;
    } else if (_passwordTwoOne.text != '' &&
        _passwordTwo.text != '' &&
        (_passwordTwoOne.text == _passwordTwo.text)) {
      return true;
    } else{
       errorDialog('ERROR', 'passwords doesnot match !');
    }
  }
}
