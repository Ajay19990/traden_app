import 'package:flutter/material.dart';
import 'package:traden_app/pages/welcome_page.dart';
import 'utilities/constants.dart';

void main() {
  runApp(TradenApp());
}

class TradenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        buttonTheme: ButtonThemeData(height: 42, buttonColor: Colors.indigoAccent),
        textTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.indigoAccent,
            fontSize: 24,
            letterSpacing: 0.0,
            fontWeight: FontWeight.bold,
          ),
          bodyText1: TextStyle(
            color: Colors.indigoAccent,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
