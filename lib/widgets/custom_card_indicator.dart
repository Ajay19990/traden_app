import 'package:flutter/material.dart';
import 'package:traden_app/utilities/constants.dart';

class CustomCardIndicator extends StatelessWidget {
  final int currentIndex;
  final List<dynamic> items;

  CustomCardIndicator({
    @required this.currentIndex,
    @required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: items.map((item) {
        int index = items.indexOf(item);
        return Container(
          width: 7.0,
          height: 7.0,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentIndex == index ? Colors.indigoAccent : Colors.grey[400],
          ),
        );
      }).toList(),
    );
  }
}
