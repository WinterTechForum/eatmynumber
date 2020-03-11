import 'package:eatmynumber/pages/drawer/drawer.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../api.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final storage = new FlutterSecureStorage();
  String apiRegisterUrl = "https://burn451.herokuapp.com/register";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Eat My Number'),
      ),
      drawer: AppDrawer(),
        body: Form(
      key: _formKey,
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 32.0, horizontal: 26.0),
          //EdgeInsets.all(14.0),
          alignment: Alignment.topLeft,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(hintText: 'Input Token'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onSaved: (String value) {
                  storage.write(key: "userToken", value: value);
                },
              ),
              SizedBox(height: 20),
              RaisedButton(
                child: Text("Sign In"),
                onPressed: () {
                  if (!_formKey.currentState.validate()) return;
                  _formKey.currentState.save();
                  Navigator.pushNamed(context, "/home");
                },
              ),
              SizedBox(height: 40),
              RaisedButton(
                child: Text("Sign Up"),
                onPressed: () {
                  API().register();
                  Navigator.pushNamed(context, "/home");
                },
              )
            ],
          )),
    ));
  }
}
