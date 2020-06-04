import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BlueButton extends StatelessWidget {

  BlueButton(this.text, {@required this.onPressed});

  String text;
  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.lightBlue,
      child: Text(
        text,
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
      onPressed: onPressed,
    );
  }

}
