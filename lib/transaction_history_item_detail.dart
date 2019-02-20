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
      body: Column(
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
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            height: 40,
            // decoration: BoxDecoration(
            //   border: Border(
            //     top: BorderSide(color: Colors.grey[200]),
            //     bottom: BorderSide(color: Colors.grey[200]),
            //   ),
            // ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Transaction Id",
                  style: TextStyle(fontSize: 16, color: Colors.blue[700]),
                ),
                Text(
                  transactionHistoyModel.transactionId.toString(),
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Transaction Method",
                  style: TextStyle(fontSize: 16, color: Colors.blue[700]),
                ),
                Text(
                  transactionHistoyModel.transactionMethod,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Created",
                  style: TextStyle(fontSize: 16, color: Colors.blue[700]),
                ),
                Text(
                  transactionHistoyModel.created,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Completed",
                  style: TextStyle(fontSize: 16, color: Colors.blue[700]),
                ),
                Text(
                  transactionHistoyModel.completed,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Cancelled",
                  style: TextStyle(fontSize: 16, color: Colors.blue[700]),
                ),
                Text(
                  transactionHistoyModel.cancelled,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Currency Conversion",
                  style: TextStyle(fontSize: 16, color: Colors.blue[700]),
                ),
                Text(
                  transactionHistoyModel.primaryCurrency +
                      "  ->  " +
                      transactionHistoyModel.convertedTo,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Conversion Rate",
                  style: TextStyle(fontSize: 16, color: Colors.blue[700]),
                ),
                Text(
                  transactionHistoyModel.conversionRate,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
