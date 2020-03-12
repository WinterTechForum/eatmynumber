import 'package:eatmynumber/pages/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../api.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final storage = new FlutterSecureStorage();
  String apiRegisterUrl = "https://burn451.herokuapp.com/register";
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                  final nav = Navigator.of(context);
                  nav.popAndPushNamed("/home");
                },
              ),
              SizedBox(height: 40),
              RaisedButton(
                child: Text("Sign Up"),
                onPressed: () async {
                  bool success = await API().register();
                  if (success) {
                    Navigator.pushNamed(context, "/home");
                  }
                  showSnackBarError();
                },
              )
            ],
          )),
    ));
  }

  void showSnackBarError(){
    final snackbar = SnackBar(content: Text("Error reaching service"));
    _scaffoldKey.currentState..showSnackBar(snackbar);
  }
}
