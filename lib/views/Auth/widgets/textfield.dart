import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String imgpath;
  final TextEditingController controller;
  final String hintTxt;
  final bool isPassword;
  CustomTextField(
      {Key key, this.imgpath, this.controller, this.hintTxt, this.isPassword})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: screenheight / 12,
          width: screenwidth / 6,
          decoration: BoxDecoration(
              borderRadius: new BorderRadius.circular(8.0),
              image: DecorationImage(
                  image: AssetImage(imgpath), fit: BoxFit.fill)),
        ),
        SizedBox(
          width: screenwidth / 2,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintTxt,
            ),
            obscureText: isPassword,
          ),
        ),
      ],
    );
  }
}

class CustomTextFieldTwo extends StatelessWidget {
  final String imgpath;
  final TextEditingController controller;
  final String hintTxt;
  final bool isPassword;
  CustomTextFieldTwo(
      {Key key, this.imgpath, this.controller, this.hintTxt, this.isPassword})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: screenwidth / 1.8,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintTxt,
            ),
            obscureText: isPassword,
          ),
        ),
      ],
    );
  }
}

class CustomTextFieldThree extends StatelessWidget {
  final String imgpath;
  final TextEditingController controller;
  final String hintTxt;
  final bool isPassword;
  final double val;
  final String txt;
  CustomTextFieldThree(
      {Key key,
      this.imgpath,
      this.controller,
      this.hintTxt,
      this.isPassword,
      this.val,
      this.txt
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(txt,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800)),
        SizedBox(
          width: screenwidth / val,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintTxt,
            ),
            obscureText: isPassword,
            enabled: false,
          ),
        ),
      ],
    );
  }
}
