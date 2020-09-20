import 'package:flutter/material.dart';
import 'package:traden_app/models/category.dart';
import 'dart:math';

class CategoryCard extends StatelessWidget {
  final Category category;
  final Function onTap;
  CategoryCard({this.category, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              height: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/carousel${1 + Random().nextInt(3 - 1)}.png'),
                ),
              ),
            ),
            Text(
              category.name,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
