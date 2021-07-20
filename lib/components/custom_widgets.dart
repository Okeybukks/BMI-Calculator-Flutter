import 'package:flutter/material.dart';
import '../constants.dart';

class CustomCard extends StatelessWidget {
  final Color cardColor;
  final Widget customChild;
  final Function onPress;

  CustomCard({@required this.cardColor, this.customChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: onPress,
        child: Card(
          child: customChild,
          color: cardColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}

class CustomIcon extends StatelessWidget {
  final IconData icon;
  final String text;

  CustomIcon({this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 88.0,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          text,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}

class CustomColumn extends StatelessWidget {

  final String bodyProperty;
  final String bodyPropertyUnit;
  final int bodyPropertyValue;
  final Widget customChild;
  CustomColumn({this.bodyProperty, this.bodyPropertyValue, this.bodyPropertyUnit, this.customChild});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          bodyProperty.toUpperCase(),
          style: kLabelTextStyle,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              Text(
                bodyPropertyValue.toString(),
                style: kLabelTextStyle1,
              ),
              SizedBox(width: 5),
              Text(
                bodyPropertyUnit,
                style: kLabelTextStyle,
              )
            ],
          ),
        ),
        customChild,
      ],
    );
  }
}



