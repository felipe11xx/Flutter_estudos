import 'package:carros/Resources/strings.dart';
import 'package:carros/utils/navigation.dart';
import 'package:flutter/material.dart';

alert(BuildContext context, String msg) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(Strings.cars),
          content: Text(msg),
          actions: <Widget>[
            FlatButton(
              child: Text(Strings.ok),
              onPressed: () {
                pop(context);
              },
            )
          ],
        );
      });
}
