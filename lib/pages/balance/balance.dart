import 'package:eatmynumber/pages/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:eatmynumber/api.dart';
import 'package:flutter/services.dart';

class BalancePage extends StatefulWidget {
  BalancePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BalancePageState createState() => _BalancePageState();
}

class _BalancePageState extends State<BalancePage> {
  int _balance = 0;
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _textController.dispose();
    super.dispose();
  }

  void _addBalance() {
    int balanceIncrease = int.parse(_textController.text);
    API().addFunds(balanceIncrease * 60).then((b) {
      print("BALANCE $b");
      setState(() {
        _balance = b;
      });
    });
  }

  void _getBalance() {
    API().checkFunds().then((b) {
      print("BALANCE $b");
      setState(() {
        _balance = b;
      });
    });
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
            if (_balance > 0)
              Container(
                margin: const EdgeInsets.all(30.0),
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Your remaining time: \n${_balance / 60} minutes',
                  style: TextStyle(
                    fontSize: 30.0, fontWeight: FontWeight.bold,),
                ),
              ),
            RaisedButton(
                onPressed: () {
                  _getBalance();
                },
                child: Text('Get balance')),
            Form(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 32.0, horizontal: 64.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: 'Enter minutes to add',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some minutes';
                        }
                        return null;
                      },
                      controller: _textController,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: RaisedButton(
                        onPressed: () {
                          _addBalance();
                        },
                        child: Text('Add minutes to your balance'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
