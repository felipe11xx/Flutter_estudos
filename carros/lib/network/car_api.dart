import 'dart:convert' as convert;

import 'package:carros/domain/car.dart';
import 'package:carros/domain/user.dart';
import 'package:http/http.dart' as http;

class TypeCar{
  static final String sportive = "esportivos";
  static final String classic = "classicos";
  static final String lux = "luxo";
}

class CarApi {
  static Future<List<Car>> getCars(String type) async {

    User user = await User.get();

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${user.token}"
    };

    var url = 'https://carros-springboot.herokuapp.com/api/v2/carros/tipo/$type';

      var response = await http.get(url, headers: headers);

      String json = response.body;

      List listResponse = convert.json.decode(json);

      final cars = listResponse.map<Car>((map) => Car.fromJson(map)).toList();

      return cars;
  }
}
