import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/Reuseablecard.dart';
import 'package:bmi_calculator/components/bottomButton.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen(
      {@required this.bmiResult,
      @required this.textResult,
      @required this.description});

  final String bmiResult;
  final String textResult;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Result',
                style: KTitleResultStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Reuseablecard(
              colour: KUntappedContainerColor,
              MyCards: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    textResult,
                    style: KResultTextstyle,
                  ),
                  Text(
                    bmiResult,
                    style: KResultNUmberStyle,
                  ),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: KBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: BottomButton(
              ButtomTitle: 'RE-CALCULATE',
              OnTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
