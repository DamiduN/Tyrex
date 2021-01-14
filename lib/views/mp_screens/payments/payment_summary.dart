import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:tyrex/views/Auth/widgets/button.dart';
import 'package:tyrex/views/Auth/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

class PaymentSummary extends StatefulWidget {
  final double amount;
  PaymentSummary({Key key, this.amount}) : super(key: key);
  @override
  _PaymentSummaryState createState() => _PaymentSummaryState();
}

class _PaymentSummaryState extends State<PaymentSummary> {
  final _amount = TextEditingController();
  final _serviceTax = TextEditingController();
  final _totalAmount = TextEditingController();
  String _errorTxt = '';
  ProgressDialog pr;

  @override
  void initState() {
    _amount.text = widget.amount.toString();
    _serviceTax.text = "200";
    _totalAmount.text = (widget.amount + 200).toString(); 
    super.initState();
  }

  @override
  void dispose() {
    _amount.dispose();
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
                    Text("Payment Summary",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800)),
                    SizedBox(height: screenheight / 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomTextFieldThree(
                          controller: _amount,
                          hintTxt: '',
                          isPassword: false,
                          val: 2.5,
                          txt: "Amount :  ",
                        ),
                      ],
                    ),
                    SizedBox(height: screenheight / 30),
                    CustomTextFieldThree(
                      controller: _serviceTax,
                      hintTxt: '',
                      isPassword: false,
                      val: 2.5,
                      txt: "Service Tax :  ",
                    ),
                    SizedBox(height: screenheight / 30),
                    CustomTextFieldThree(
                      controller: _totalAmount,
                      hintTxt: '',
                      isPassword: false,
                      val: 2.5,
                      txt: "Total Amount :  ",
                    ),
                    SizedBox(height: screenheight / 30),
                    GestureDetector(
                      onTap: () {
                        if (validate()) {}
                      },
                      child: Button(
                        text: "Credit/Debit Card Payment",
                        color: Colors.white,
                        btnTxtColor: Colors.black,
                        height: screenheight / 15,
                        width: screenwidth / 9,
                      ),
                    ),
                    SizedBox(height: screenheight / 30),
                    GestureDetector(
                      onTap: () {
                        if (validate()) {}
                      },
                      child: Button(
                        text: "Cash on pickup",
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
    if (_amount.text == '' &&
        _serviceTax.text == '' &&
        _totalAmount.text == '') {
      errorDialog('ERROR', 'Fields cant be empty !');

      return false;
    } else if (_amount.text == '' ||
        _serviceTax.text == '' ||
        _totalAmount.text == '') {
      errorDialog('ERROR', 'Fields cant be empty !');

      return false;
    } else if (_amount.text != '' &&
        _serviceTax.text != '' &&
        (_totalAmount.text != '')) {
      return true;
    }
  }
}
