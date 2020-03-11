import 'package:eatmynumber/pages/login/login.dart';
import 'package:eatmynumber/pages/home/home.dart';
import 'package:eatmynumber/pages/splash/splash.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eat My Number',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => Splash(),
        // When navigating to the "/" route, build the FirstScreen widget.
        '/home': (context) => MyHomePage(title: 'Get a Phone Number'),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/login': (context) => LoginPage(),
      },
    );
  }
}
