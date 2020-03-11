import 'package:eatmynumber/pages/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final storage = new FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Eat My Number'),
      ),
      drawer: AppDrawer(),
      body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                onSaved: (String value) {
                  storage.write(key: "userToken", value: value);
                },
              ),
              RaisedButton(
                onPressed: () {
                  _formKey.currentState.save();
                  Navigator.pushNamed(context, "/home");
                },
              )
            ],
          )),
    );
  }
}
