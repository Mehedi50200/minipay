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
    Color tTypeBgColor;
    Color tTypeFColor;

    switch (transactionHistoyModel.transactionType) {
      case "Deposit":
        tTypeBgColor = Color(0x60E65520);
        tTypeFColor = Color(0xFFE65520);
        break;
      case "Withdraw":
        tTypeBgColor = Color(0x6028335C);
        tTypeFColor = Color(0xFF28335C);
        break;
      case "Transfer":
        tTypeBgColor = Color(0x60F4A601);
        tTypeFColor = Color(0xFFBF8800);
        break;
      case "Charge":
        tTypeBgColor = Color(0x60629BBE);
        tTypeFColor = Color(0xFF00158E);
        break;
      case "Refund":
        tTypeBgColor = Color(0x60A7C783);
        tTypeFColor = Color(0xFF00753D);
        break;
      default:
        tTypeBgColor = Color(0x60629BBE);
        tTypeFColor = Color(0xFF629BBE);
    }
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    TransactionDetail(this.transactionHistoyModel)),
          );
        },
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey[300]),
            ),
          ),
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      "MYR " + transactionHistoyModel.transactionAmount,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.symmetric(vertical: 2),
                    width: 90,
                    decoration: BoxDecoration(
                      color: tTypeBgColor,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Text(
                      transactionHistoyModel.transactionType,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: tTypeFColor,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                child: Text(
                  transactionHistoyModel.transactionState,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
