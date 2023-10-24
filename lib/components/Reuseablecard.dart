import 'package:flutter/material.dart';

class Reuseablecard extends StatelessWidget {
  Reuseablecard({@required this.colour, this.MyCards, this.onPress});

  final Color colour;
  final Widget MyCards;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: MyCards,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.all(15.0),
      ),
    );
  }
}
