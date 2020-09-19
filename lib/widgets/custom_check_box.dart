import 'package:flutter/material.dart';
import 'package:traden_app/widgets/custom_thin_button.dart';

class CustomCheckBox extends StatelessWidget {
  final Function onTap;
  final bool isSelected;

  CustomCheckBox({this.onTap, this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? Colors.indigoAccent : Colors.indigoAccent[100],
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Icon(
                  Icons.check,
                  size: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          CustomThinButton(
            title: 'I agree with all Terms and Conditions',
            horizontalPadding: 0,
            onPressed: null,
          ),
        ],
      ),
    );
  }
}
