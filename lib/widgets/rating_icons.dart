import 'package:flutter/material.dart';

class RatingWidget extends StatefulWidget {
  final int rating;
  RatingWidget(this.rating);

  @override
  _RatingWidgetState createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 6; i++) {
      if (i <= widget.rating) {
        _icons.add(Icon(Icons.star, color: Colors.amber[800], size: 20));
      } else {
        _icons.add(Icon(Icons.star, color: Colors.grey[350], size: 20));
      }
    }
  }

  List<Icon> _icons = [];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(children: _icons),
        SizedBox(width: 5),
        Text(
          '${widget.rating}',
          style: TextStyle(color: Colors.amber[800], fontSize: 16),
        ),
      ],
    );
  }
}
