import 'package:flutter/material.dart';

class ServiceDetailButton extends StatelessWidget {
  final String imageName;
  final String title;
  final Function onTap;

  ServiceDetailButton({this.imageName, this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          ImageIcon(
            AssetImage('assets/$imageName.png'),
            color: Colors.indigoAccent,
          ),
          SizedBox(width: 6),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
