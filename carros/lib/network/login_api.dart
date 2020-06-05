import 'dart:convert';

import 'package:carros/Resources/strings.dart';
import 'package:carros/domain/user.dart';
import 'package:carros/network/api_response.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<ApiResponse<User>> login(String login, String password) async {
    try {
      var url = 'https://carros-springboot.herokuapp.com/api/v2/login';

      Map<String, String> headers = {"Content-Type": "application/json"};

      final params = {
        'username': login,
        'password': password,
      };

      String s = json.encode(params);

      var response = await http.post(url, body: s, headers: headers);

      Map mapResponse = json.decode(response.body);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final user = User.fromJson(mapResponse);

        return ApiResponse.ok(user);
      }
      return ApiResponse.error(mapResponse["error"]);
    } catch (error, exception) {
      print('Erro no Login: $exception');
      return ApiResponse.error(Strings.loginError);
    }
  }
}
