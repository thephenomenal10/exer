import 'dart:math';

import 'package:flutter/material.dart';
import 'package:upi_pay/upi_pay.dart';
import '../constants.dart';
import './BookSlot.dart';

class ProceedToPayment extends StatefulWidget {
  final double amount;
  final String workout;
  ProceedToPayment(this.amount, this.workout);

  @override
  _ProceedToPaymentState createState() => _ProceedToPaymentState();
}

class _ProceedToPaymentState extends State<ProceedToPayment> {
  final _upiAddressController = TextEditingController();
  final _amountController = TextEditingController();

  Future<List<ApplicationMeta>> _appsFuture;

  @override
  void initState() {
    super.initState();

    _amountController.text =
        (Random.secure().nextDouble() * 10).toStringAsFixed(2);
    _appsFuture = UpiPay.getInstalledUpiApplications();
  }

  @override
  void dispose() {
    _amountController.dispose();
    _upiAddressController.dispose();
    super.dispose();
  }

  Future<void> _onTap(ApplicationMeta app) async {
    final transactionRef = Random.secure().nextInt(1 << 32).toString();
    print("Starting transaction with id $transactionRef");

    final response = await UpiPay.initiateTransaction(
      amount: widget.amount.toString(),
      app: app.upiApplication,
      receiverName: 'Deepti Jain',
      receiverUpiAddress: 'shakuntlasharma@icici',
      transactionRef: transactionRef,
      merchantCode: '7372',
    );

    UpiTransactionResponse id = new UpiTransactionResponse(response.toString());

    if (response.status == UpiTransactionStatus.success) {
      return Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => BookSlot(widget.workout, widget.amount)));
    } else {
      return _addDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Container(
              margin: EdgeInsets.only(top: 200, bottom: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 12),
                    child: Text(
                      'Pay Using',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                  FutureBuilder<List<ApplicationMeta>>(
                    future: _appsFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState != ConnectionState.done) {
                        return Container();
                      }

                      return snapshot.data.isNotEmpty
                          ? GridView.count(
                              crossAxisCount: 2,
                              shrinkWrap: true,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              childAspectRatio: 1.6,
                              physics: NeverScrollableScrollPhysics(),
                              children: snapshot.data
                                  .map((it) => Material(
                                        key: ObjectKey(it.upiApplication),
                                        color: Colors.grey[200],
                                        child: InkWell(
                                          onTap: () => _onTap(it),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Image.memory(
                                                it.icon,
                                                width: 64,
                                                height: 64,
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(top: 4),
                                                child: Text(
                                                  it.upiApplication
                                                      .getAppName(),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ))
                                  .toList())
                          : new Text(
                              "Note: You must have atleast one UPI app",
                              style: new TextStyle(
                                  color: Colors.red, fontSize: 20.0),
                            );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future<dynamic> _addDialog(BuildContext context) async {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title:
              Center(child: Text("Your payment is failed, please try again")),
          content: SingleChildScrollView(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 70),
                  child: Center(
                    child: RaisedButton(
                      color: Colors.pink,
                      child: Text(
                        "ok",
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      });
}
