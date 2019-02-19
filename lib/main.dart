import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:minipay/transaction_history_model.dart';
import 'package:minipay/transaction_tile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue[700],
      ),
      home: TransactionPage(title: 'Flutter Demo Home Page'),
    );
  }
}

enum _MaterialListType {
  oneLine,
  oneLineWithAvatar,
  twoLine,
  threeLine,
}

class TransactionPage extends StatefulWidget {
  TransactionPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
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
          x["conversationRate"]);
      transactionList.add(transactionItem);
    }
    return transactionList;
  }

  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();

  PersistentBottomSheetController<void> _bottomSheet;
  _MaterialListType _transactionType = _MaterialListType.threeLine;

  void changeItemType(_MaterialListType type) {
    setState(() {
      _transactionType = type;
    });
    _bottomSheet?.setState(() {});
  }

  void _showConfigurationSheet() {
    final PersistentBottomSheetController<void> bottomSheet = scaffoldKey
        .currentState
        .showBottomSheet<void>((BuildContext bottomSheetContext) {
      return Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Colors.black26)),
        ),
        child: ListView(
          shrinkWrap: true,
          primary: false,
          children: <Widget>[],
        ),
      );
    });

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

  @override
  Widget build(BuildContext context) {
    String itemTypeText;
    switch (_transactionType) {
      case _MaterialListType.oneLine:
      case _MaterialListType.oneLineWithAvatar:
        itemTypeText = 'Single-line';
        break;
      case _MaterialListType.twoLine:
        itemTypeText = 'Two-line';
        break;
      case _MaterialListType.threeLine:
        itemTypeText = 'Three-line';
        break;
    }

    //  Iterable<Widget> listTiles = items.map<Widget>((String item) => buildListTile(context, item));

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Scrolling list\n$itemTypeText'),
        actions: <Widget>[
          //  MaterialDemoDocumentationButton(ListDemo.routeName),
          IconButton(
            icon: Icon(
              Theme.of(context).platform == TargetPlatform.iOS
                  ? Icons.more_horiz
                  : Icons.more_vert,
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
                height: MediaQuery.of(context).size.height-90,
                child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    int x;
                    if(index==0){
                      x=0;
                    }else{
                      x=1;
                    }
                    return TransationTile(transactionListData[index],transactionListData[index-x]);
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
}

Widget transatctiontype() {
  return new Container(
    color: Colors.white30,
    child: new GridView.count(
      crossAxisCount: 4,
      childAspectRatio: 1.0,
      padding: const EdgeInsets.all(4.0),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      children: <Widget>[],
    ),
  );
}
