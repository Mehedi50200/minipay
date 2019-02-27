import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:minipay/transaction_history_model.dart';
import 'package:minipay/transaction_item.dart';

class TransactionPage extends StatefulWidget {
  TransactionPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _TransactionPageState createState() => new _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  var _currentTransferTypeSelected = 'Deposit';
  var _transferTypeList = [
    'Deposit',
    'Withdraw',
    'Transfer',
    'Charge',
    'Refund'
  ];

  var _currentDateSelected = 'Last One Month';
  var _dateRangeList = [
    'Last One Month',
    'Last Two Months',
    'Last Three Months',
    'Last Four Months',
    'Last 1 year'
  ];

  Future<List<TransactionHistoryModel>> _getTransactionModel() async {
    var data = await rootBundle.loadString('assets/transactionHistory.json');
    var jsonData = json.decode(data);

    List<TransactionHistoryModel> transactionList = [];
    for (var x in jsonData) {
      TransactionHistoryModel transactionItem = TransactionHistoryModel(
          x["transactionId"],
          x["transactionAmount"],
          x["transactionState"],
          x["transactionMethod"],
          x["transactionType"],
          x["created"],
          x["completed"],
          x["cancelled"],
          x["primaryCurrency"],
          x["convertedTo"],
          x["conversionRate"]);
      transactionList.add(transactionItem);
    }
    return transactionList;
  }

  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();

  PersistentBottomSheetController<void> _bottomSheet;
  String itemTypeText;

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Transaction History'),
        actions: <Widget>[
          IconButton(
            icon: Image(
              image: AssetImage('assets/controlswhite.png'),
              width: 20,
            ),
            tooltip: 'Show menu',
            onPressed: _bottomSheet == null ? _showConfigurationSheet : null,
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FutureBuilder(
          future: _getTransactionModel(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              var transactionListData = snapshot.data;
              return Container(
                height: MediaQuery.of(context).size.height - 88,
                color: Colors.grey[100],
                child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    int x;
                    if (index == 0) {
                      x = 0;
                    } else {
                      x = 1;
                    }
                    return TransationTile(transactionListData[index],
                        transactionListData[index - x]);
                  },
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  void _showConfigurationSheet() {
    final PersistentBottomSheetController<void> bottomSheet =
        scaffoldKey.currentState.showBottomSheet<void>(
      (BuildContext bottomSheetContext) {
        return Container(
          height: 200,
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 20.0,
            ),
          ]),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Image(
                      image: AssetImage('assets/controls.png'),
                      width: 20,
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(Icons.close),
                      iconSize: 20,
                      onPressed: _bottomSheet.close,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Transaction Type'),
                  DropdownButton(
                    items: _transferTypeList.map((String transferType) {
                      return DropdownMenuItem<String>(
                        value: transferType,
                        child: new Text(transferType),
                      );
                    }).toList(),
                    value: _currentTransferTypeSelected,
                    onChanged: (String selectedTransferType) {
                      setState(() {
                        _currentTransferTypeSelected = selectedTransferType;
                        print(_currentTransferTypeSelected);
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Month Range'),
                  DropdownButton(
                    items: _dateRangeList.map((String dateDuration) {
                      return DropdownMenuItem<String>(
                        value: dateDuration,
                        child: new Text(dateDuration),
                      );
                    }).toList(),
                    value: _currentDateSelected,
                    onChanged: (String selectedTransferType) {
                      setState(() {
                        _currentDateSelected = selectedTransferType;
                        print(_currentDateSelected);
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );

    setState(() {
      _bottomSheet = bottomSheet;
    });

    _bottomSheet.closed.whenComplete(() {
      if (mounted) {
        setState(() {
          _bottomSheet = null;
        });
      }
    });
  }
}
