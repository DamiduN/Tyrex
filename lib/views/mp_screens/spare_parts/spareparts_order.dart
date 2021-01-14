import 'package:flutter/material.dart';
import 'package:tyrex/views/Auth/widgets/button.dart';
import 'package:tyrex/views/mp_screens/payments/payment_summary.dart';

class SparePartsOrder extends StatefulWidget {
  SparePartsOrder({Key key}) : super(key: key);

  @override
  _SparePartsOrderState createState() => _SparePartsOrderState();
}

class _SparePartsOrderState extends State<SparePartsOrder> {
  bool buzzer = false;
  bool crashGuard = false;
  bool engineGuard = false;
  bool frontLinear = false;
  bool gearLeaver = false;
  bool handGrip = false;
  bool helmetLock = false;
  bool helmet = false;
  bool numberPlateCover = false;
  bool pillionHolder = false;
  bool seatCover = false;
  bool tankCover = false;
  bool breakpads = false;
  bool signallightCup = false;
  bool headligth = false;

  double total = 0.00;

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Container(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenheight / 20),
                Text("Payment Summary",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                        SizedBox(height: screenheight / 40),
                ListTile(
                  title: const Text('Select All Parts',style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                  leading: Checkbox(
                    checkColor: Colors.greenAccent,
                    activeColor: Colors.red,
                    value: this.buzzer,
                    onChanged: (bool value) {
                      if (value) {
                        setState(() {
                          total += 20500;
                          this.buzzer = value;
                          buzzer = true;
                          crashGuard = true;
                          engineGuard = true;
                          frontLinear = true;
                          gearLeaver = true;
                          handGrip = true;
                          helmetLock = true;
                          helmet = true;
                          numberPlateCover = true;
                          pillionHolder = true;
                          seatCover = true;
                          tankCover = true;
                          breakpads = true;
                          signallightCup = true;
                          headligth = true;
                        });
                      } else {
                        setState(() {
                          total = 0.00;
                          this.buzzer = value;
                          buzzer = false;
                          crashGuard = false;
                          engineGuard = false;
                          frontLinear = false;
                          gearLeaver = false;
                          handGrip = false;
                          helmetLock = false;
                          helmet = false;
                          numberPlateCover = false;
                          pillionHolder = false;
                          seatCover = false;
                          tankCover = false;
                          breakpads = false;
                          signallightCup = false;
                          headligth = false;
                        });
                      }
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Buzzer -         Rs.450'),
                  leading: Checkbox(
                    checkColor: Colors.greenAccent,
                    activeColor: Colors.red,
                    value: this.buzzer,
                    onChanged: (bool value) {
                      setState(() {
                        this.buzzer = value;
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
                ),
                ListTile(
                  title: const Text('Crash Guard -       Rs.2515'),
                  leading: Checkbox(
                    checkColor: Colors.greenAccent,
                    activeColor: Colors.red,
                    value: this.crashGuard,
                    onChanged: (bool value) {
                      setState(() {
                        this.crashGuard = value;
                      });

                      if (value) {
                        setState(() {
                          total += 2515;
                        });
                      } else {
                        setState(() {
                          total -= 2515;
                        });
                      }
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Engine Guard -       Rs.2175'),
                  leading: Checkbox(
                    checkColor: Colors.greenAccent,
                    activeColor: Colors.red,
                    value: this.engineGuard,
                    onChanged: (bool value) {
                      setState(() {
                        this.engineGuard = value;
                      });

                      if (value) {
                        setState(() {
                          total += 2175;
                        });
                      } else {
                        setState(() {
                          total -= 2175;
                        });
                      }
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Front Liner box -       Rs.2175'),
                  leading: Checkbox(
                    checkColor: Colors.greenAccent,
                    activeColor: Colors.red,
                    value: this.frontLinear,
                    onChanged: (bool value) {
                      setState(() {
                        this.frontLinear = value;
                      });

                      if (value) {
                        setState(() {
                          total += 2175;
                        });
                      } else {
                        setState(() {
                          total -= 2175;
                        });
                      }
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Gear Lever -      Rs.2000'),
                  leading: Checkbox(
                    checkColor: Colors.greenAccent,
                    activeColor: Colors.red,
                    value: this.gearLeaver,
                    onChanged: (bool value) {
                      setState(() {
                        this.gearLeaver = value;
                      });

                      if (value) {
                        setState(() {
                          total += 2000;
                        });
                      } else {
                        setState(() {
                          total -= 2000;
                        });
                      }
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Hand Grip -       Rs.1000'),
                  leading: Checkbox(
                    checkColor: Colors.greenAccent,
                    activeColor: Colors.red,
                    value: this.handGrip,
                    onChanged: (bool value) {
                      setState(() {
                        this.handGrip = value;
                      });

                      if (value) {
                        setState(() {
                          total += 1000;
                        });
                      } else {
                        setState(() {
                          total -= 1000;
                        });
                      }
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Helmat Lock -       Rs.650'),
                  leading: Checkbox(
                    checkColor: Colors.greenAccent,
                    activeColor: Colors.red,
                    value: this.helmetLock,
                    onChanged: (bool value) {
                      setState(() {
                        this.helmetLock = value;
                      });

                      if (value) {
                        setState(() {
                          total += 650;
                        });
                      } else {
                        setState(() {
                          total -= 650;
                        });
                      }
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Helmet -       Rs.320'),
                  leading: Checkbox(
                    checkColor: Colors.greenAccent,
                    activeColor: Colors.red,
                    value: this.helmet,
                    onChanged: (bool value) {
                      setState(() {
                        this.helmet = value;
                      });

                      if (value) {
                        setState(() {
                          total += 320;
                        });
                      } else {
                        setState(() {
                          total -= 320;
                        });
                      }
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Number Plate Cover -     Rs.7500'),
                  leading: Checkbox(
                    checkColor: Colors.greenAccent,
                    activeColor: Colors.red,
                    value: this.numberPlateCover,
                    onChanged: (bool value) {
                      setState(() {
                        this.numberPlateCover = value;
                      });

                      if (value) {
                        setState(() {
                          total += 7500;
                        });
                      } else {
                        setState(() {
                          total -= 7500;
                        });
                      }
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Pillion Holder -       Rs.800'),
                  leading: Checkbox(
                    checkColor: Colors.greenAccent,
                    activeColor: Colors.red,
                    value: this.pillionHolder,
                    onChanged: (bool value) {
                      setState(() {
                        this.pillionHolder = value;
                      });

                      if (value) {
                        setState(() {
                          total += 800;
                        });
                      } else {
                        setState(() {
                          total -= 800;
                        });
                      }
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Seat Cover -       Rs.750'),
                  leading: Checkbox(
                    checkColor: Colors.greenAccent,
                    activeColor: Colors.red,
                    value: this.seatCover,
                    onChanged: (bool value) {
                      setState(() {
                        this.seatCover = value;
                      });

                      if (value) {
                        setState(() {
                          total += 750;
                        });
                      } else {
                        setState(() {
                          total -= 750;
                        });
                      }
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Tank Cover -       Rs.1000'),
                  leading: Checkbox(
                    checkColor: Colors.greenAccent,
                    activeColor: Colors.red,
                    value: this.tankCover,
                    onChanged: (bool value) {
                      setState(() {
                        this.tankCover = value;
                      });

                      if (value) {
                        setState(() {
                          total += 1000;
                        });
                      } else {
                        setState(() {
                          total -= 1000;
                        });
                      }
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Break Pads -       Rs.1650'),
                  leading: Checkbox(
                    checkColor: Colors.greenAccent,
                    activeColor: Colors.red,
                    value: this.breakpads,
                    onChanged: (bool value) {
                      setState(() {
                        this.breakpads = value;
                      });

                      if (value) {
                        setState(() {
                          total += 1650;
                        });
                      } else {
                        setState(() {
                          total -= 1650;
                        });
                      }
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Signal light cups -       Rs.2150'),
                  leading: Checkbox(
                    checkColor: Colors.greenAccent,
                    activeColor: Colors.red,
                    value: this.signallightCup,
                    onChanged: (bool value) {
                      setState(() {
                        this.signallightCup = value;
                      });

                      if (value) {
                        setState(() {
                          total += 2150;
                        });
                      } else {
                        setState(() {
                          total -= 2150;
                        });
                      }
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Head light -       Rs.3150'),
                  leading: Checkbox(
                    checkColor: Colors.greenAccent,
                    activeColor: Colors.red,
                    value: this.headligth,
                    onChanged: (bool value) {
                      setState(() {
                        this.headligth = value;
                      });

                      if (value) {
                        setState(() {
                          total += 3150;
                        });
                      } else {
                        setState(() {
                          total -= 3150;
                        });
                      }
                    },
                  ),
                ),
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
                          builder: (context) => PaymentSummary(amount: total)));
                    },
                    child: Button(
                      text: "Order",
                      color: Colors.white,
                      btnTxtColor: Colors.black,
                      height: screenheight / 15,
                      width: screenwidth / 9,
                    ),
                  ),
                ),
                SizedBox(height: screenheight / 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
