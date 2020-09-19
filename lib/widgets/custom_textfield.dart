import 'package:flutter/material.dart';
import 'package:traden_app/utilities/helper_functions.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  final String hintText;
  final Color iconColor;
  final bool hide;
  final TextEditingController textFieldController;
  Function onPressed = () {};
  final Function validateField;
  final bool isPasswordTF;

  CustomTextField({
    this.hintText,
    this.iconColor,
    this.hide = false,
    this.onPressed,
    this.isPasswordTF = false,
    this.textFieldController,
    this.validateField,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Theme(
        child: TextFormField(
          controller: textFieldController,
          obscureText: hide,
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter some text';
            } else {
              return validateField(value);
            }
            return null;
          },
          decoration: InputDecoration(
            // errorText: validateField,
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
