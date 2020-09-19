import 'package:flutter/material.dart';

class CustomThinButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final double height;
  final double horizontalPadding;

  CustomThinButton({
    this.title,
    this.onPressed,
    this.height = 16,
    this.horizontalPadding = 28.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
          ),
          child: SizedBox(
            height: height,
            child: FlatButton(
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              onPressed: onPressed,
            ),
          ),
        ),
      ],
    );
  }
}
