import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final Function onPress;
  final iconValue;
  RoundButton({@required this.onPress, @required this.iconValue});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6,
      child: Icon(
        iconValue,
        color: Colors.white,
      ),
      shape: CircleBorder(),
      onPressed: onPress,
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}