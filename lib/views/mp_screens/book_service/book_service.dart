import 'package:flutter/material.dart';
import 'package:tyrex/views/Auth/widgets/button.dart';
import 'package:tyrex/views/mp_screens/payments/payment_summary.dart';

class BookingScreen extends StatefulWidget {
  BookingScreen({Key key}) : super(key: key);

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

enum ServiceType { fullservice, regularservice }

class _BookingScreenState extends State<BookingScreen> {
  ServiceType _type = ServiceType.regularservice;
  String sertype = "regular";
  bool oilchange = false;
  bool filters = false;
  bool normalwash = false;
  bool repairdamage = false;
  bool highwash = false;
  bool freepickup = false;
  bool freedrop = false;

  double total = 0.00;

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Column(
        children: <Widget>[
          SizedBox(height: screenheight / 20),
          Text("Select the service type",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Colors.black)),
          ListTile(
            title: const Text('Regular service'),
            leading: Radio(
              value: ServiceType.regularservice,
              groupValue: _type,
              onChanged: (ServiceType value) {
                setState(() {
                  _type = value;
                  sertype = 'regular';
                  oilchange = false;
                  filters = false;
                  normalwash = false;
                  repairdamage = false;
                  highwash = false;
                  total = 0;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Full Service - Rs.7000'),
            leading: Radio(
              value: ServiceType.fullservice,
              groupValue: _type,
              onChanged: (ServiceType value) {
                setState(() {
                  _type = value;
                  sertype = 'full';
                  oilchange = true;
                  filters = true;
                  normalwash = true;
                  repairdamage = true;
                  highwash = true;
                  total = 4000;
                });
              },
            ),
          ),
          Divider(),
          Row(
            children: [
              Checkbox(
                checkColor: Colors.greenAccent,
                activeColor: Colors.red,
                value: this.oilchange,
                onChanged: (bool value) {
                  setState(() {
                    this.oilchange = value;
                  });

                  if (value) {
                    setState(() {
                      total += 600;
                    });
                  } else {
                    setState(() {
                      total -= 600;
                    });
                  }
                },
              ),
              Text("Oil Change - Rs.600",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
            ],
          ),
          Row(
            children: [
              Checkbox(
                checkColor: Colors.greenAccent,
                activeColor: Colors.red,
                value: this.filters,
                onChanged: (bool value) {
                  setState(() {
                    this.filters = value;
                  });

                  if (value) {
                    setState(() {
                      total += 400;
                    });
                  } else {
                    setState(() {
                      total -= 400;
                    });
                  }
                },
              ),
              Text("Filters - Rs.400",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
            ],
          ),
          _type == ServiceType.regularservice
              ? Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.greenAccent,
                      activeColor: Colors.red,
                      value: this.normalwash,
                      onChanged: (bool value) {
                        setState(() {
                          this.normalwash = value;
                        });

                        if (value) {
                          setState(() {
                            total += 350;
                          });
                        } else {
                          setState(() {
                            total -= 350;
                          });
                        }
                      },
                    ),
                    Text("Normal Wash - Rs.350",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                  ],
                )
              : Container(),
          Row(
            children: [
              Checkbox(
                checkColor: Colors.greenAccent,
                activeColor: Colors.red,
                value: this.repairdamage,
                onChanged: (bool value) {
                  setState(() {
                    this.repairdamage = value;
                  });

                  if (value) {
                    setState(() {
                      total += 3000;
                    });
                  } else {
                    setState(() {
                      total -= 3000;
                    });
                  }
                },
              ),
              Text("Repair Damage  - Rs.3000",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
            ],
          ),
          _type == ServiceType.fullservice
              ? Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.greenAccent,
                      activeColor: Colors.red,
                      value: this.highwash,
                      onChanged: (bool value) {
                        setState(() {
                          this.highwash = value;
                        });
                      },
                    ),
                    Text("High Pressure Wash",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                  ],
                )
              : Container(),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                checkColor: Colors.greenAccent,
                activeColor: Colors.red,
                value: this.freepickup,
                onChanged: (bool value) {
                  setState(() {
                    this.freepickup = value;
                  });
                },
              ),
              Text("Free pickup",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.red)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                checkColor: Colors.greenAccent,
                activeColor: Colors.red,
                value: this.freedrop,
                onChanged: (bool value) {
                  setState(() {
                    this.freedrop = value;
                  });
                },
              ),
              Text("Free Drop",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.red)),
            ],
          ),
          SizedBox(height: screenheight / 30),
          Divider(),
          Container(
            child: Text("Bill Total Rs.$total",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.black)),
          ),
          SizedBox(height: screenheight / 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PaymentSummary(
                          amount: total,
                          servicetype: sertype,
                          oilchange: oilchange,
                          filters: filters,
                          normalwash: normalwash,
                          repairdamage: repairdamage,
                          highwash: highwash,
                          freepickup: freepickup,
                          freedrop: freedrop,
                        )));
              },
              child: Button(
                text: "Book Service",
                color: Colors.white,
                btnTxtColor: Colors.black,
                height: screenheight / 15,
                width: screenwidth / 9,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
