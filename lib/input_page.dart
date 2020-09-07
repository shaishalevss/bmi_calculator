import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const bottomContainerHeight = 60.0;
const reusableCardColor = Color(0xFF1D1E33);
const bottomContainerColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
                    child: ReusableCard(
                        reusableCardColor,
                        IconContent(FontAwesomeIcons.mars,'MALE')),
                  ),
                  Expanded(
                    child: ReusableCard(
                        reusableCardColor,
                        IconContent(FontAwesomeIcons.venus,'FEMALE')),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(reusableCardColor, null),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(reusableCardColor, null),
                  ),
                  Expanded(
                    child: ReusableCard(reusableCardColor, null),
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

class IconContent extends StatelessWidget {

  final IconData icon;
  final String label;

  IconContent(@required IconData this.icon, @required String this.label){
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: TextStyle(
              fontSize: 18.0, color: Color(0xFF8D8E98)),
        )
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard(@required this.newColor, Widget this.cardChild) {}
  final Color newColor;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: newColor,
      ),
    );
  }
}
