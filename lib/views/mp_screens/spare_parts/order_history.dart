import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderHistory extends StatefulWidget {
  final String uid;
  OrderHistory({Key key, this.uid}) : super(key: key);

  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  Map data;

  @override
  void initState() {
    super.initState();
    print(widget.uid);
    fetchData();
  }

  fetchData() {
    final CollectionReference bookingCollection =
        Firestore.instance.collection('orders');

    bookingCollection
        .where('uid', isEqualTo: widget.uid)
        .snapshots()
        .listen((value) {
      if (value.documents.isNotEmpty) {
        setState(() {
          data = value.documents.asMap();
        });
        print(data[2]['total']);
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: screenheight / 30),
              Text("Order History",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: Colors.black)),
              SizedBox(height: screenheight / 30),
              data != null
                  ? Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              margin: EdgeInsets.symmetric(horizontal: 30),
                              width: screenwidth,
                              color: Colors.black,
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "Full total - Rs.${data[index]['total']}",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white)),
                                  SizedBox(height: screenheight / 40),
                                  Text(
                                      "Payment type - ${data[index]['paymenttype']} payment",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white)),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
