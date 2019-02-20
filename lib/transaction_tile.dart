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
  Color tTypeColor;

  

  void tTypeColorFunction(){
    if (transactionHistoyModel.transactionType.toString() == "Deposit"){
      tTypeColor =Color(0x30E65520);
    }else if (transactionHistoyModel.transactionType.toString() == "Withdraw"){
      tTypeColor =Color(0x3028335C);
    }else if (transactionHistoyModel.transactionType.toString() == "Transfer"){
      tTypeColor =Color(0x30F4A601);
    }else if (transactionHistoyModel.transactionType.toString() == "Charge"){
      tTypeColor =Color(0x30A7C783);
    }else if (transactionHistoyModel.transactionType.toString() == "Refund"){
      tTypeColor =Color(0x30629BBE);
    }else{
      tTypeColor =Color(0x30629BBE);
    }
  }

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
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: tTypeColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      transactionHistoyModel.transactionType,
                      textAlign: TextAlign.center,
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
                      transactionHistoyModel.transactionAmount + " MYR",
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
