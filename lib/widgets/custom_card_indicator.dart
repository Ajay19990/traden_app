import 'package:flutter/material.dart';
import 'package:traden_app/utilities/constants.dart';

class CustomCardIndicator extends StatelessWidget {
  final int currentIndex;

  CustomCardIndicator({@required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: carouselItems.map((onBoardingCard) {
        int index = carouselItems.indexOf(onBoardingCard);
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
