import 'package:aula01/models/fictional_characters.dart';
import 'package:flutter/material.dart';

class FictionalCharacterPage extends StatelessWidget {

  final FictionalCharacter ficChar;

  FictionalCharacterPage(this.ficChar);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ficChar.name),
      ),
      body: Image.asset(ficChar.image),
    );
  }
}
