import 'package:flutter/material.dart';
import 'package:minipay/transaction_history_model.dart';
import 'package:minipay/transaction_history_item_detail.dart';
import 'package:flutter/cupertino.dart';

Size screenSize;

class TransationTile extends StatelessWidget {
  final TransactionHistoryModel transactionHistoyModel;
  final TransactionHistoryModel previousItem;
  const TransationTile(this.transactionHistoyModel, this.previousItem,
      {Key key})
      : super(key: key);

  _isMatched() {
    if (transactionHistoyModel.completed == previousItem.completed &&
        transactionHistoyModel.transactionId.toString() !=
            previousItem.transactionId.toString()) {
      return false;
    } else
      return true;
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _isMatched() ? buildDateContainer() : Container(),
        buildListItem(context),
      ],
    );
  }

  Widget buildDateContainer() {
    return Container(
      height: 30,
      width: screenSize.width,
      padding: EdgeInsets.only(top: 5, bottom: 5, left: 20),
      margin: EdgeInsets.only(top: 5),
      child: Text(
        transactionHistoyModel.completed,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Colors.blue[700],
          fontSize: 15,
        ),
      ),
    );
  }

  Widget buildListItem(BuildContext context) {
    Color tStateColor;
    AssetImage imgTransactionType;

    switch (transactionHistoyModel.transactionType) {
      case "Deposit":
        imgTransactionType = AssetImage('assets/deposit.png');
        break;
      case "Withdraw":
        imgTransactionType = AssetImage('assets/withdraw.png');
        break;
      case "Transfer":
        imgTransactionType = AssetImage('assets/transfer.png');
        break;
      case "Charge":
        imgTransactionType = AssetImage('assets/charge.png');
        break;
      case "Refund":
        imgTransactionType = AssetImage('assets/refund.png');
        break;
      default:
        imgTransactionType = AssetImage('assets/charge.png');
    }

    switch (transactionHistoyModel.transactionState) {
      case "Succeeded":
        tStateColor = Colors.green;
        break;
      case "Pending":
        tStateColor = Colors.blue;
        break;
      case "Timeout":
        tStateColor = Colors.orange;
        break;
      case "Cancelled":
        tStateColor = Colors.purpleAccent;
        break;
      case "Failed":
        tStateColor = Colors.red;
        break;
      default:
        tStateColor = Colors.grey;
    }
    return Container(
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(
          color: Colors.grey[200],
          width: .5,
        ),
      )),
      child: Material(
        color: Colors.white,
        child: InkWell(
          //  onTap: () {},
          child: ListTile(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: imgTransactionType,
                ),
                Text(
                  transactionHistoyModel.transactionType,
                  //textAlign: TextAlign.end,
                  // style: TextStyle(
                  //   fontSize: 20,
                  // ),
                ),
              ],
            ),
            title: Text(
              "MYR " + transactionHistoyModel.transactionAmount,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            subtitle: Text(
              transactionHistoyModel.transactionState,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.italic,
                color: tStateColor,
              ),
            ),
          ),
          // enabled: ,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      TransactionDetail(this.transactionHistoyModel)),
            );
          },
        ),
      ),
    );
  }
}
