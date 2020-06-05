import 'package:carros/Resources/strings.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.cars),
      ),
      body: _body(),
    );
  }

  _body() => Center(
        child: Text("lalal",
          style: TextStyle(
            fontSize: 22
          ),
        ),
      );
}
