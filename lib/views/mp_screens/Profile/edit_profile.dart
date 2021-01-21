import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:provider/provider.dart';
import 'package:tyrex/models/user.dart';
import 'package:tyrex/srevices/database.dart';
import 'package:tyrex/views/Auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:tyrex/views/Auth/widgets/button.dart';
import 'package:tyrex/views/Auth/widgets/textfield.dart';
import 'package:progress_dialog/progress_dialog.dart';

class EditProfile extends StatefulWidget {
  final String uid;
  final String name;
  final String address;
  final String email;
  final String bikename;
  final String bikemodel;
  final String regno;
  final String password;

  EditProfile(
      {this.uid,
      this.name,
      this.address,
      this.email,
      this.bikename,
      this.bikemodel,
      this.regno,
      this.password});
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _name = TextEditingController();
  final _address = TextEditingController();
  final _email = TextEditingController();
  final _bikename = TextEditingController();
  final _model = TextEditingController();
  final _regNo = TextEditingController();
  final _password = TextEditingController();

  ProgressDialog pr;

  @override
  void initState() {
    print(widget.name);
    setState(() {
      _name.text = widget.name;
      _address.text = widget.address;
      _email.text = widget.email;
      _bikename.text = widget.bikename;
      _model.text = widget.bikemodel;
      _regNo.text = widget.regno;
      _password.text = widget.password;
    });
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();

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
              // SizedBox(height: screenheight / 50),
              Image.asset(
                'assets/images/profile.png',
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height / 9,
              ),
              SizedBox(height: screenheight / 40),
              CustomTextFieldTwo(
                controller: _name,
                hintTxt: 'Full name',
                isPassword: false,
              ),
              SizedBox(height: screenheight / 50),
              CustomTextFieldTwo(
                controller: _address,
                hintTxt: 'Address',
                isPassword: false,
              ),
              SizedBox(height: screenheight / 50),
              CustomTextFieldTwo(
                controller: _email,
                hintTxt: 'Email',
                isPassword: false,
              ),
              SizedBox(height: screenheight / 50),
              CustomTextFieldTwo(
                controller: _bikename,
                hintTxt: 'Bike Name',
                isPassword: false,
              ),
              SizedBox(height: screenheight / 50),
              CustomTextFieldTwo(
                controller: _model,
                hintTxt: 'Bike Model',
                isPassword: false,
              ),
              SizedBox(height: screenheight / 50),
              CustomTextFieldTwo(
                controller: _regNo,
                hintTxt: 'Register No',
                isPassword: false,
              ),
              SizedBox(height: screenheight / 50),
             
              SizedBox(height: screenheight / 30),

              GestureDetector(
                onTap: () async {
                  if (validate()) {
                    await DatabaseService(uid: user.uid).saveUserData(
                        _name.text,
                        _address.text,
                        _email.text,
                        _bikename.text,
                        _model.text,
                        _regNo.text,
);
                    Navigator.pop(context);
                  }
                },
                child: Button(
                  text: "Update Profile",
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
    if (_email.text.isEmpty &&
        _address.text.isEmpty &&
        _name.text.isEmpty &&
        _bikename.text.isEmpty &&
        _model.text.isEmpty &&
        _regNo.text.isEmpty &&
        _password.text.isEmpty) {
      errorDialog('ERROR', 'Fields cannott be empty !');

      return false;
    } else if (_email.text.isEmpty ||
        _address.text.isEmpty ||
        _name.text.isEmpty ||
        _bikename.text.isEmpty ||
        _model.text.isEmpty ||
        _regNo.text.isEmpty ||
        _password.text.isEmpty) {
      errorDialog('ERROR', 'Fields cannot be empty !');
      return false;
    } else if (_email.text.length <= 9) {
      errorDialog('ERROR', 'Please enter a valid E-mail address !');

      return false;
    } else {
      return true;
    }
  }
}
