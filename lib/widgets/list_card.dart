import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  final String imageName;
  final String title;
  final String description;
  final Function onTapHandler;

  ListCard({
    @required this.imageName,
    @required this.title,
    @required this.description,
    @required this.onTapHandler,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapHandler,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 9,
                child: Image.asset(imageName),
              ),
              Expanded(
                flex: 3,
                child: Wrap(
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headline4,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  description,
                  style: Theme.of(context).textTheme.bodyText2,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
