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

    Map<String,String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${user.token}"
    };

    var url = 'https://carros-springboot.herokuapp.com/api/v2/carros/tipo/$type';

    print("GET > $url");

    var response = await http.get(url, headers: headers);

    String json = response.body;

    List list = convert.json.decode(json);
    print("${list.toString()}");
    List<Car> cars = list.map<Car>((map) => Car.fromJson(map)).cast<Car>().toList();

    return cars;
  }
}
