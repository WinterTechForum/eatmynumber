import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Splash extends StatelessWidget {
  final storage = FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    storage.read(key: "userToken").then((value) {
      if (null != value) Navigator.pushNamed(context, "/home");
      else Navigator.pushNamed(context, "/login");
    });
    return Center(
      child: Text("Eat My Number")
    );
  }
}