import 'package:flutter/material.dart';

class CustomThinButton extends StatelessWidget {
  final String title;
  final Function onPressed;

  CustomThinButton({this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 28.0,
          ),
          child: SizedBox(
            height: 16,
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
