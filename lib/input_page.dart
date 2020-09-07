import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

const bottomContainerHeight = 60.0;
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);

enum GenderType{male, female}


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  GenderType selectedGenderType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI CALCULATOR')),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(selectedGenderType == GenderType.male ? activeCardColor : inactiveCardColor,
                        IconContent(FontAwesomeIcons.mars, 'MALE'),(){
                          setState(() {
                            selectedGenderType = GenderType.male;
                          });                        }
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(selectedGenderType == GenderType.female ? activeCardColor : inactiveCardColor,
                        IconContent(FontAwesomeIcons.venus, 'FEMALE'),(){
    setState(() {
    selectedGenderType = GenderType.female;
    });    }
                  ),
               )],
              ),
            ),
            Expanded(
              child: ReusableCard(activeCardColor, null,null),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(activeCardColor, null,null),
                  ),
                  Expanded(
                    child: ReusableCard(activeCardColor, null,null),
                  ),
                ],
              ),
            ),
            Container(
              color: bottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
            )
          ],
        ));
  }
}
