import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Color iconColor;
  final bool hide;
  Function onPressed = () {};
  final bool isPasswordTF;

  CustomTextField({
    this.hintText,
    this.iconColor,
    this.hide = false,
    this.onPressed,
    this.isPasswordTF = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Theme(
        child: TextField(
          obscureText: hide,
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
