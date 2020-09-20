import 'package:flutter/material.dart';
import 'package:traden_app/pages/home_page.dart';
import 'package:traden_app/pages/welcome_page.dart';
import 'utilities/constants.dart';

void main() {
  runApp(TradenApp());
}

class TradenApp extends StatefulWidget {
  @override
  _TradenAppState createState() => _TradenAppState();
}

class _TradenAppState extends State<TradenApp> {
  var isLoggedIn = '';

  @override
  void initState() {
    super.initState();
    checkForLogin();
  }

  void checkForLogin() async {
    isLoggedIn = await storage.read(key: 'isLoggedIn');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: isLoggedIn == 'true' ? HomePage() : WelcomePage(),
      routes: {'/homePage': (ctx) => HomePage()},
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
          headline5: TextStyle(
            color: Colors.indigo[600],
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          headline4: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          headline3: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
            letterSpacing: 0.2,
          ),
          bodyText2: TextStyle(
            fontSize: 11,
          ),
        ),
      ),
    );
  }
}
