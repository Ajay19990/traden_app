import 'package:flutter/material.dart';
import 'package:traden_app/widgets/custom_button.dart';
import 'package:traden_app/constants.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('TRADENAPP', textAlign: TextAlign.center, style: kPageHeading),
              Flexible(child: Container()),
              CustomButton(title: 'Login', onPressed: () {}),
              CustomButton(title: 'Sign up', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
