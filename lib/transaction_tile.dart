import 'package:flutter/material.dart';
import 'package:minipay/transaction_history_model.dart';
import 'package:flutter/cupertino.dart';

class TransationTile extends StatefulWidget {
  final TransactionHistoryModel transactionHistoyModel;
  final TransactionHistoryModel previousItem;

  const TransationTile(this.transactionHistoyModel, this.previousItem,
      {Key key})
      : super(key: key);

  @override
  _PostListItem createState() =>
      _PostListItem(this.transactionHistoyModel, this.previousItem);
}

class _PostListItem extends State<TransationTile> {
  final TransactionHistoryModel transactionHistoyModel;
  final TransactionHistoryModel previousItem;
  bool isExpaned = false;

  _PostListItem(this.transactionHistoyModel, this.previousItem);

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
    Color tTypeBgColor;
    Color tTypeFColor;
    Size screenSize = MediaQuery.of(context).size;
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
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpaned = !isExpaned;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _isMatched()
              ? Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width,
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
                )
              : Container(),
          AnimatedContainer(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
            duration: Duration(milliseconds: 350),
            margin: EdgeInsets.fromLTRB(0, 2, 0, 2),
            curve: Curves.linear,
            decoration: BoxDecoration(
              color: Colors.white,
              
            ),
            height: isExpaned ? 400 : 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: tTypeBgColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            transactionHistoyModel.transactionType,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: tTypeFColor,
                              fontFamily: "PTSerif Regular",
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          child: Text(
                            transactionHistoyModel.transactionAmount + " MYR",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontFamily: "PTSerif Bold",
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Text(
                            transactionHistoyModel.transactionState,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "PTSerif Italic",
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                isExpaned
                    ? Expanded(
                        flex: 6,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.all(3),
                                width: screenSize.width,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.blue[700],
                                      width: 1.0,
                                    ),
                                    top: BorderSide(
                                      color: Colors.blue[700],
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "Details",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: "PTSerif Bold",
                                      fontSize: 16,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: ListTile(
                                leading: Text("Transaction Id"),
                                title: Text(transactionHistoyModel.transactionId
                                    .toString()),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: ListTile(
                                leading: Text("Transaction Method"),
                                title: Text(
                                    transactionHistoyModel.transactionMethod),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: ListTile(
                                leading: Text("Created"),
                                title: Text(transactionHistoyModel.created),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: ListTile(
                                leading: Text("Completed"),
                                title: Text(transactionHistoyModel.completed),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: ListTile(
                                leading: Text("Cancelled"),
                                title: Text(transactionHistoyModel.cancelled),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: ListTile(
                                leading: Text("Currency"),
                                title: Text(
                                    transactionHistoyModel.primaryCurrency +
                                        " > " +
                                        transactionHistoyModel.convertedTo),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: ListTile(
                                leading: Text("Conversition Rate"),
                                title: Text(
                                  transactionHistoyModel.conversionRate,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget buildPostTitle() {
  //   return Row();
  // }
}
