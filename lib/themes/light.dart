import 'package:flutter/material.dart';

ThemeData lightMode(){
  return ThemeData(
    // Define the default brightness and colors.
    brightness: Brightness.light,
    primaryColor: Colors.lightBlue[900],
    accentColor: Colors.cyan[600],

    // Define the default font family.
    fontFamily: 'Georgia',

    // Define the default TextTheme. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: TextTheme(
      headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.lightBlue[900],
      textTheme: ButtonTextTheme.primary,
    ),
  );
}