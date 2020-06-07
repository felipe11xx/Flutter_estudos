import 'package:carros/domain/car.dart';
import 'package:carros/resources/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarPage extends StatelessWidget {
  Car car;

  CarPage(this.car);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.cars),
      ),
      body: _body(),
    );
  }
  _body(){
    return Container(
        padding: EdgeInsets.all(16),
        child: Image.network(car.urlFoto));
  }
}
