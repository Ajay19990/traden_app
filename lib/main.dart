import 'package:flutter/material.dart';

void main() {
  runApp(TradenApp());
}

class TradenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TradenApp')),
      body: Center(
        child: Text('Hello there'),
      ),
    );
  }
}
