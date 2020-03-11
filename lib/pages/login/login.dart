import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<LoginPage> {
  String token;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                onSaved: (String value) {
                  token = value;
                },
              ),
              RaisedButton(
                onPressed: () {
                  _formKey.currentState.save();
                  Navigator.pushNamed(context, "/");
                },
              )
            ],
          )),
    );
  }
}
