import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import '../components/bottom_button.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum GenderType { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType selectedGenderType;
  int height = 175;
  int weight = 70;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI CALCULATOR')),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                        selectedGenderType == GenderType.male
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        IconContent(FontAwesomeIcons.mars, 'MALE'), () {
                      setState(() {
                        selectedGenderType = GenderType.male;
                      });
                    }),
                  ),
                  Expanded(
                    child: ReusableCard(
                        selectedGenderType == GenderType.female
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        IconContent(FontAwesomeIcons.venus, 'FEMALE'), () {
                      setState(() {
                        selectedGenderType = GenderType.female;
                      });
                    }),
                  )
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                  kActiveCardColor,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'HEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            height.toString(),
                            style: kNumberTextStyle,
                          ),
                          Text(
                            'cm',
                            style: kLabelTextStyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0),
                          thumbColor: kSliderThumbColor,
                          activeTrackColor: Colors.white,
                          overlayColor: kSliderOverlayColor,
                          inactiveTrackColor: kSliderInactiveTrackColor,
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 230.0,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  null),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                        kActiveCardColor,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('WEIGHT', style: kLabelTextStyle),
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(FontAwesomeIcons.plus, (){
                                  setState(() {
                                    weight++;
                                  });
                                }),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(FontAwesomeIcons.minus, (){
                                  setState(() {
                                    weight--;
                                  });
                                }),
                              ],
                            )
                          ],
                        ),
                        null),
                  ),
                  Expanded(
                    child: ReusableCard(kActiveCardColor, Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE', style: kLabelTextStyle),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(FontAwesomeIcons.plus, (){
                              setState(() {
                                age++;
                              });
                            }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(FontAwesomeIcons.minus, (){
                              setState(() {
                                age--;
                              });
                            }),
                          ],
                        )
                      ],
                    ), null),
                  ),
                ],
              ),
            ),
            BottomButton(
                (){
                  CalculatorBrain calc = CalculatorBrain(height,weight);

                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => ResultPage(calc.calculateBMI(),calc.getResult(),calc.getInterpretation()),
                  ),);
                }, 'CALCULATE'
            ),
          ],
        ));
  }
}



