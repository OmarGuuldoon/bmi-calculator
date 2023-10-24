import 'package:bmi_calculator/screens/results_screen.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/Reuseablecard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/IconContent.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/operationButton.dart';
import 'package:bmi_calculator/components/bottomButton.dart';
import 'package:bmi_calculator/calculations.dart';

enum GenderType {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('bmi calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reuseablecard(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderType.male;
                      });
                    },
                    MyCards: IconContent(
                      icons: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                    colour: selectedGender == GenderType.male
                        ? KTappedContainerColor
                        : KUntappedContainerColor,
                  ),
                ),
                Expanded(
                  child: Reuseablecard(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderType.female;
                      });
                    },
                    MyCards: IconContent(
                      icons: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                    colour: selectedGender == GenderType.female
                        ? KTappedContainerColor
                        : KUntappedContainerColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Reuseablecard(
              MyCards: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: Klabelstyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: KLabelNumberStyle,
                        ),
                        Text(
                          'cm',
                          style: Klabelstyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: Color(0xFFEB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                        overlayColor: Color(0x1fEB1555),
                        activeTrackColor: Color(0xFFFFFFFF),
                        inactiveTrackColor: Color(0xFF8D8E98),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newHeight) {
                          setState(() {
                            height = newHeight.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              colour: KUntappedContainerColor,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reuseablecard(
                    MyCards: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: Klabelstyle,
                        ),
                        Text(
                          weight.toString(),
                          style: KLabelNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OperatorButton(
                              icon: FontAwesomeIcons.minus,
                              Onpressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            OperatorButton(
                              icon: FontAwesomeIcons.plus,
                              Onpressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    colour: KUntappedContainerColor,
                  ),
                ),
                Expanded(
                  child: Reuseablecard(
                    MyCards: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: Klabelstyle,
                        ),
                        Text(
                          age.toString(),
                          style: KLabelNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OperatorButton(
                                icon: FontAwesomeIcons.minus,
                                Onpressed: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            OperatorButton(
                                icon: FontAwesomeIcons.plus,
                                Onpressed: () {
                                  setState(() {
                                    age++;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                    colour: KUntappedContainerColor,
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
              ButtomTitle: 'CALCULATE',
              OnTap: () {
                Calculator calculate =
                    Calculator(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(
                      bmiResult: calculate.calculate_bmi(),
                      textResult: calculate.getResult(),
                      description: calculate.Description(),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
