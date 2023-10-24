import 'package:flutter/material.dart';

class OperatorButton extends StatelessWidget {
  OperatorButton({@required this.icon, @required this.Onpressed});

  final IconData icon;
  final Function Onpressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Color(0xFF4C4E5E),
      shape: CircleBorder(),
      onPressed: Onpressed,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      child: Icon(icon),
    );
  }
}
