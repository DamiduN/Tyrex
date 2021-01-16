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
import 'package:tyrex/views/mp_screens/payments/order_payment_screen.dart';

class OrderPaymentSummary extends StatefulWidget {
  final double amount;
  bool buzzer;
  bool crashGuard;
  bool engineGuard;
  bool frontLinear;
  bool gearLeaver;
  bool handGrip;
  bool helmetLock;
  bool helmet;
  bool numberPlateCover;
  bool pillionHolder;
  bool seatCover;
  bool tankCover;
  bool breakpads;
  bool signallightCup;
  bool headligth;
  OrderPaymentSummary({
    Key key,
    this.amount,
    this.buzzer,
    this.crashGuard,
    this.engineGuard,
    this.frontLinear,
    this.gearLeaver,
    this.handGrip,
    this.helmetLock,
    this.helmet,
    this.numberPlateCover,
    this.pillionHolder,
    this.seatCover,
    this.tankCover,
    this.breakpads,
    this.signallightCup,
    this.headligth,
  }) : super(key: key);
  @override
  _OrderPaymentSummaryState createState() => _OrderPaymentSummaryState();
}

class _OrderPaymentSummaryState extends State<OrderPaymentSummary> {
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
    print(widget.buzzer);

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
                              builder: (context) => OrderPaymentScreen(
                                  amount: double.parse(_totalAmount.text),
                                  buzzer: widget.buzzer,
                                  crashGuard: widget.crashGuard,
                                  engineGuard: widget.engineGuard,
                                  frontLinear: widget.frontLinear,
                                  gearLeaver: widget.gearLeaver,
                                  handGrip: widget.handGrip,
                                  helmetLock: widget.helmetLock,
                                  helmet: widget.helmet,
                                  numberPlateCover: widget.numberPlateCover,
                                  pillionHolder: widget.pillionHolder,
                                  seatCover: widget.seatCover,
                                  tankCover: widget.tankCover,
                                  breakpads: widget.breakpads,
                                  signallightCup: widget.signallightCup,
                                  headligth: widget.headligth)));
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
                              .saveOrder(
                                  widget.buzzer,
                                  widget.crashGuard,
                                  widget.engineGuard,
                                  widget.frontLinear,
                                  widget.gearLeaver,
                                  widget.handGrip,
                                  widget.helmetLock,
                                  widget.helmet,
                                  widget.numberPlateCover,
                                  widget.pillionHolder,
                                  widget.seatCover,
                                  widget.tankCover,
                                  widget.breakpads,
                                  widget.signallightCup,
                                  widget.headligth,
                                  widget.amount,
                                  'cash')
                              .whenComplete(() {
                            successDialog('SUCCESS', 'Order Successful !');
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
