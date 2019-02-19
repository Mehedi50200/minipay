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

  bool state;

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
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _isMatched()
              ? Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                  ),
                  child: Text(
                    transactionHistoyModel.completed,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                )
              : Container(),
          Container(
            height: 60,
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Text(
                      transactionHistoyModel.transactionType,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Text(
                      transactionHistoyModel.transactionState,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Text(
                      transactionHistoyModel.transactionAmount + " USD",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontFamily: "AbrilFatface",
                          fontSize: 18,
                          fontWeight: FontWeight.w100),
                    ),
                  ),
                ),
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
