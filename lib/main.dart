import 'package:flutter/material.dart';
import 'package:minipay/transaction_history.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue[700],
      ),
      home: TransactionPage(title: 'Flutter Demo Home Page'),
    );
  }
  
}

