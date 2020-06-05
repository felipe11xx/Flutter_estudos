import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  String text;
  Function onPressed;
  bool showProgress;

  AppButton(this.text, {this.onPressed, this.showProgress = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: RaisedButton(
        color: Colors.deepPurpleAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: showProgress
            ? Container(
                height:30,
                width: 30,
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
              )
            : Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
        onPressed: onPressed,
      ),
    );
  }
}
