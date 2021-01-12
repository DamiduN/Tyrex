import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final color;
  final btnTxtColor;
  final width;
  final height;
  Button(
      {Key key,
      this.text,
      this.color,
      this.btnTxtColor,
      this.width,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: color,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
      child: Padding(
        padding: EdgeInsets.only(left: width, right: width),
        child: Text(text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16, color: btnTxtColor, fontWeight: FontWeight.w500)
                ),
      ),
    );
  }
}
