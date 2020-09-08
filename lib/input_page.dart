import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';

enum GenderType { male, female }

class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  GenderType selectedGenderType;
  int height = 175;

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
              child: ReusableCard(kActiveCardColor, Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('HEIGHT', style: kLabelTextStyle,),Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString(), style: kNumberTextStyle,), Text('cm', style: kLabelTextStyle,)
                    ],
                  ), Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 230.0,
                    activeColor: Color(0xFFEB1555),
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newValue){
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  )
                ],
              ), null),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(kActiveCardColor, null, null),
                  ),
                  Expanded(
                    child: ReusableCard(kActiveCardColor, null, null),
                  ),
                ],
              ),
            ),
            Container(
              color: kBottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
            )
          ],
        ));
  }
}
