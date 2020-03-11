import 'package:eatmynumber/pages/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:eatmynumber/api.dart';

class BalancePage extends StatefulWidget {
  BalancePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BalancePageState createState() => _BalancePageState();
}

class _BalancePageState extends State<BalancePage> {
  int _balance = 0;

  void _addBalance(int minutes) {
    int balance = 0;
    setState(() {
      _balance = balance;
    });
  }

  void _getBalance() {
    int balance = 0;
    API().checkFunds().then((b) {
      balance = b;
    });
    setState(() {
      _balance = balance;
    });
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
          width: 10,
          color: Colors.red
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Balance'),
      ),
      drawer: AppDrawer(),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                onPressed: () {
                  _getBalance();
                },
                child: Text('Get balance')
            ),
            if(_balance > 0)
              Container(
                margin: const EdgeInsets.all(30.0),
                padding: const EdgeInsets.all(10.0),
                decoration: myBoxDecoration(), //             <--- BoxDecoration here
                child: Text(
                  '$_balance',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
              ), Container()
            ,
          ],
        ),
      ),
    );
  }
}