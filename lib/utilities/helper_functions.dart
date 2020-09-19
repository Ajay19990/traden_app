import 'package:flutter/material.dart';
import 'package:traden_app/widgets/custom_thin_button.dart';

String validatePassword(String value) {
  if (!(value.length > 5) && value.isNotEmpty) {
    return 'Password should contains more then 5 character';
  }
  return null;
}

String validateEmail(String value) {
  if (value.isNotEmpty &&
      !(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value))) {
    return 'Invalid Email';
  }
  return null;
}

void showAlert({BuildContext context, String message}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      Widget okButton = CustomThinButton(
        title: 'Ok',
        height: 24,
        horizontalPadding: 0,
        onPressed: () {
          Navigator.pop(context);
        },
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: [
          okButton,
        ],
      );
      return alert;
    },
  );
}
