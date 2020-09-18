import 'package:flutter/material.dart';
import 'package:traden_app/pages/welcome_page.dart';
import 'constants.dart';

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
      ),
    );
  }
}
