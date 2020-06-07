import 'dart:async';

import 'package:carros/domain/user.dart';
import 'package:carros/network/api_response.dart';
import 'package:carros/network/login_api.dart';
import 'package:carros/pages/simple_bloc.dart';

class LoginBloc {
  final buttonBloc = BooleanBloc();

  Future<ApiResponse<User>> login(String login, String password) async {
    buttonBloc.add(true);
    ApiResponse response = await LoginApi.login(login, password);
    buttonBloc.add(false);
    return response;
  }

  void dispose(){
    buttonBloc.dispose();
  }


}