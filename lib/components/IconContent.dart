import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class IconContent extends StatelessWidget {
  IconContent({this.icons, this.label});
  final IconData icons;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icons,
          size: KIconsize,
        ),
        KSpace,
        Text(
          label,
          style: Klabelstyle,
        ),
      ],
    );
  }
}
