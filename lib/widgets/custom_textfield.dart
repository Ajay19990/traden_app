import 'package:flutter/material.dart';
import 'package:traden_app/utilities/helper_functions.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  final String hintText;
  final String errorText;
  final Color iconColor;
  final bool hide;
  final TextEditingController textFieldController;
  Function onPressed = () {};
  final Function validateField;
  final bool isPasswordTF;
  final double verticalPadding;

  CustomTextField({
    this.hintText,
    this.errorText,
    this.iconColor,
    this.hide = false,
    this.onPressed,
    this.isPasswordTF = false,
    this.textFieldController,
    this.validateField,
    this.verticalPadding = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: verticalPadding),
      child: Theme(
        child: TextFormField(
          controller: textFieldController,
          obscureText: hide,
          validator: (value) {
            if (value.isEmpty) {
              return '$errorText can\'t be empty.';
            } else if (validateField != null) {
              return validateField(value);
            } else {
              return null;
            }
            return null;
          },
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 12),
            suffixIcon: isPasswordTF
                ? IconButton(onPressed: onPressed, icon: Icon(Icons.remove_red_eye))
                : Icon(Icons.remove, color: Colors.white),
          ),
        ),
        data: Theme.of(context).copyWith(primaryColor: iconColor),
      ),
    );
  }
}
