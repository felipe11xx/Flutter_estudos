import 'dart:async';

import 'package:carros/domain/car.dart';
import 'package:carros/network/car_api.dart';
import 'package:carros/pages/simple_bloc.dart';

class CarBloc extends SimpleBloc<List<Car>> {

  fetch(String type) async {
    try {
      List<Car> cars = await CarApi.getCars(type);
      add(cars);
    } on Exception catch (e) {
      addError(e);
    }
  }

}