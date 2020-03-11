import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Splash extends StatelessWidget {
  final storage = FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    storage.read(key: "userToken").then((value) {
      final nav = Navigator.of(context);
      final path = null == value ? '/login' : '/home';
      nav.popAndPushNamed(path);
    });
    return Center(
      child: Text("Eat My Number")
    );
  }
}