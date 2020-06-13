import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final Color color;
  final String text;
  final Function onPressed;
  RoundButton({this.color, this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0,10,0,0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 300.0,
          height: 42.0,
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}