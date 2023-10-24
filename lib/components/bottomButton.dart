import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.ButtomTitle, @required this.OnTap});

  final String ButtomTitle;
  final Function OnTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: OnTap,
      child: Container(
        color: KBottomContainerColor,
        height: KBottomContainerHeight,
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 20.0),
        margin: EdgeInsets.only(top: 10.0),
        child: Center(
          child: Text(
            ButtomTitle,
            style: KButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
