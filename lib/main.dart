import 'package:eatmynumber/pages/login/login.dart';
import 'package:eatmynumber/pages/home/home.dart';
import 'package:flutter/material.dart';

import 'themes/light.dart';

void main() => runApp(MyApp());
bool isk = true;
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Eat My Number',
      theme: lightMode(),
      initialRoute: '/login',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => MyHomePage(title: 'Get a Phone Number'),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/login': (context) => LoginPage(),
      },
    );
  }
}
