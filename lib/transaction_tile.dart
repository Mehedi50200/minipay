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
    if (transactionHistoyModel.completed == previousItem.completed && transactionHistoyModel.transactionId.toString() != previousItem.transactionId.toString()) {
      return false;
    } else
      return true;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 60,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
        ),
        child: Column(
          children: <Widget>[
            _isMatched()
                ? Expanded(
                    child: Container(
                      child: Text(transactionHistoyModel.completed),
                    ),
                  )
                : Container(),
                Expanded(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Text(
                              transactionHistoyModel.transactionId.toString(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            child: Text(
                              transactionHistoyModel.transactionState,
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
      ),
    );
  }

  // Widget buildPostTitle() {
  //   return Row();
  // }
}
