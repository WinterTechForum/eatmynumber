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
                  token = value;
                },
              ),
              SizedBox(height: 20),
              RaisedButton(
                child: Text("Sign In"),
                onPressed: () {
                  if (!_formKey.currentState.validate()) return;
                  _formKey.currentState.save();
                  Navigator.pushNamed(context, "/");
                },
              ),
              SizedBox(height: 40),
              RaisedButton(
                child: Text("Sign Up"),
                onPressed: () {
                  Navigator.pushNamed(context, "/");
                },
              )
            ],
          )),
    ));
  }
}
