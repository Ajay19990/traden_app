import 'package:flutter/material.dart';

class OnBoardingCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String description;

  OnBoardingCard({
    @required this.title,
    @required this.imagePath,
    @required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(flex: 7, child: Image.asset(imagePath)),
        Expanded(
          flex: 1,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            description,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
