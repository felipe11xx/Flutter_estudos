import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextError extends StatelessWidget {
  String errorMessage;

  TextError(this.errorMessage);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(errorMessage,
          style: TextStyle(
            color: Colors.red,
            fontSize: 22
          ),
      ),
    );
  }
}
