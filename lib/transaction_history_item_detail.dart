import 'package:flutter/material.dart';
import 'package:minipay/transaction_history_model.dart';
import 'package:flutter/cupertino.dart';

class TransactionDetail extends StatelessWidget {
  final TransactionHistoryModel transactionHistoyModel;
  const TransactionDetail(this.transactionHistoyModel, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction Details'),
      ),
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              height: 40,
              width: screenSize.width,
              // decoration: BoxDecoration(
              //   border: Border(
              //     bottom: BorderSide(color: Colors.blue[700], width: 1.0),
              //     top: BorderSide(color: Colors.blue[700], width: 1.0),
              //   ),
              // ),
              child: Text(
                "Details",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            ListTile(
              leading: Text(
                "Transaction Id",
                style: TextStyle(fontSize: 16, color: Colors.blue[700]),
              ),
              title: Text(
                transactionHistoyModel.transactionId.toString(),
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            ListTile(
              leading: Text(
                "Transaction Method",
                style: TextStyle(fontSize: 16, color: Colors.blue[700]),
              ),
              title: Text(
                transactionHistoyModel.transactionMethod,
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            ListTile(
              leading: Text(
                "Created",
                style: TextStyle(fontSize: 16, color: Colors.blue[700]),
              ),
              title: Text(
                transactionHistoyModel.created,
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            ListTile(
              leading: Text(
                "Completed",
                style: TextStyle(fontSize: 16, color: Colors.blue[700]),
              ),
              title: Text(
                transactionHistoyModel.completed,
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            ListTile(
              leading: Text(
                "Cancelled",
                style: TextStyle(fontSize: 16, color: Colors.blue[700]),
              ),
              title: Text(
                transactionHistoyModel.cancelled,
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            ListTile(
              leading: Text(
                "Currency Conversion",
                style: TextStyle(fontSize: 16, color: Colors.blue[700]),
              ),
              title: Text(
                transactionHistoyModel.primaryCurrency +
                    "  ->  " +
                    transactionHistoyModel.convertedTo,
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            ListTile(
              leading: Text(
                "Conversion Rate",
                style: TextStyle(fontSize: 16, color: Colors.blue[700]),
              ),
              title: Text(
                transactionHistoyModel.conversionRate,
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
