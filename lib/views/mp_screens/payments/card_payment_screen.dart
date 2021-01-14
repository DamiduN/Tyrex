import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:tyrex/views/mp_screens/home_screen/home_screen.dart';

class CardPaymentScreen extends StatefulWidget {
  final double amount;
  CardPaymentScreen({Key key, this.amount}) : super(key: key);

  @override
  _CardPaymentScreenState createState() => _CardPaymentScreenState();
}

class _CardPaymentScreenState extends State<CardPaymentScreen> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Default Radio Button Selected Item When App Starts.
  String radioButtonItem = 'Visa';

  // Group Value for Radio Button.
  int id = 1;

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.yellow,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              obscureCardNumber: true,
              obscureCardCvv: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              radioButtonItem = 'Visa';
                              id = 1;
                            });
                          },
                        ),
                        Container(
                          height: screenheight / 12,
                          width: screenwidth / 6,
                          decoration: BoxDecoration(
                              borderRadius: new BorderRadius.circular(8.0),
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/visacard.png'),
                                  fit: BoxFit.fill)),
                        ),
                        Radio(
                          value: 2,
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              radioButtonItem = 'Master';
                              id = 2;
                            });
                          },
                        ),
                        Container(
                          height: screenheight / 12,
                          width: screenwidth / 5,
                          decoration: BoxDecoration(
                              borderRadius: new BorderRadius.circular(8.0),
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/mastercard.png'),
                                  fit: BoxFit.fill)),
                        ),
                      ],
                    ),
                    CreditCardForm(
                      formKey: formKey,
                      obscureCvv: true,
                      obscureNumber: true,
                      cardNumberDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Number',
                        hintText: 'XXXX XXXX XXXX XXXX',
                      ),
                      expiryDateDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Expired Date',
                        hintText: 'XX/XX',
                      ),
                      cvvCodeDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'CVV',
                        hintText: 'XXX',
                      ),
                      cardHolderDecoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Card Holder',
                      ),
                      onCreditCardModelChange: onCreditCardModelChange,
                    ),
                    Text(
                          'Total Amount :-  ${widget.amount}',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'halter',
                            fontSize: 14,
                            package: 'flutter_credit_card',
                          ),
                        ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        child: const Text(
                          'Complete Payment',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'halter',
                            fontSize: 14,
                            package: 'flutter_credit_card',
                          ),
                        ),
                      ),
                      color: Colors.black,
                      onPressed: () {
                        if (formKey.currentState.validate()) {
                          print('valid!');
                          successDialog('SUCCESS', 'Successfully booked your service !');
                        } else {
                          print('invalid!');
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
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
               Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomeScreen()));
            })
        .show();
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
