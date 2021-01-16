import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:tyrex/views/Auth/widgets/button.dart';
import 'package:tyrex/views/Auth/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:tyrex/views/mp_screens/home_screen/home_screen.dart';
import 'package:tyrex/views/mp_screens/payments/card_payment_screen.dart';
import 'package:tyrex/srevices/database.dart';
import 'package:provider/provider.dart';
import 'package:tyrex/models/user.dart';

class PaymentSummary extends StatefulWidget {
  final double amount;
  final String servicetype;
  bool oilchange;
  bool filters;
  bool normalwash;
  bool repairdamage;
  bool highwash;
  bool freepickup;
  bool freedrop;
  PaymentSummary(
      {Key key,
      this.amount,
      this.servicetype,
      this.oilchange,
      this.filters,
      this.normalwash,
      this.repairdamage,
      this.highwash,
      this.freepickup,
      this.freedrop})
      : super(key: key);
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
    print(widget.servicetype);

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
    final user = Provider.of<User>(context);

    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    pr = new ProgressDialog(context, type: ProgressDialogType.Normal);

    pr.style(
        message: 'saving info',
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
                        if (validate()) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CardPaymentScreen(
                                  amount: double.parse(_totalAmount.text),
                                  servicetype: widget.servicetype,
                                  oilchange: widget.oilchange,
                                  filters: widget.filters,
                                  normalwash: widget.normalwash,
                                  repairdamage: widget.repairdamage,
                                  highwash: widget.highwash,
                                  freepickup: widget.freepickup,
                                  freedrop: widget.freedrop,
                                  )));
                        }
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
                      onTap: () async {
                        if (validate()) {
                          await DatabaseService(uid: user.uid)
                              .saveBooking(
                                  widget.servicetype,
                                  widget.oilchange,
                                  widget.filters,
                                  widget.normalwash,
                                  widget.repairdamage,
                                  widget.highwash,
                                  widget.freepickup,
                                  widget.freedrop,
                                  widget.amount,
                                  'cash')
                              .whenComplete(() {
                            successDialog('SUCCESS',
                                'Successfully booked your service !');
                          });
                        }
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
        btnOkOnPress: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomeScreen()));
        }).show();
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
      errorDialog('ERROR', 'Fields cannot be empty !');

      return false;
    } else if (_amount.text == '' ||
        _serviceTax.text == '' ||
        _totalAmount.text == '') {
      errorDialog('ERROR', 'Fields cannot be empty !');

      return false;
    } else if (_amount.text != '' &&
        _serviceTax.text != '' &&
        (_totalAmount.text != '')) {
      return true;
    }
  }
}
