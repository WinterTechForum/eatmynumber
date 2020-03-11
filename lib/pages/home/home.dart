import 'package:eatmynumber/pages/drawer/drawer.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _givenPhoneNumber;

  void setPhoneNumber(String phone) {
    setState(() {
      _givenPhoneNumber = phone;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
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

        title: Text(widget.title),
      ),
      drawer: AppDrawer(),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                setPhoneNumber("(123) 456-7890");
              },
              child: Text('Get Phone Number')
            ),
            if(_givenPhoneNumber != null)
            Container(
                margin: const EdgeInsets.all(30.0),
                padding: const EdgeInsets.all(10.0),
                decoration: myBoxDecoration(), //             <--- BoxDecoration here
                child: Text(
                  '$_givenPhoneNumber',
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