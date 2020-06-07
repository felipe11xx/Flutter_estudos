import 'dart:async';

import 'package:carros/Resources/strings.dart';
import 'package:carros/domain/user.dart';
import 'package:carros/network/api_response.dart';
import 'package:carros/pages/login/login_bloc.dart';
import 'package:carros/utils/navigation.dart';
import 'package:carros/widgets/app_alert.dart';
import 'package:carros/widgets/app_button.dart';
import 'package:carros/widgets/app_inputtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _tLogin = TextEditingController();
  final _tPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _focusPassword = FocusNode();


  final LoginBloc bloc = LoginBloc();


  @override
  void initState() {
    super.initState();

    Future<User> future = User.get();

    future.then((User user) {
      if (user != null) {
        _tLogin.text = user.nome;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Strings.cars),
        ),
        body: _body());
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            AppInputText(
              Strings.login,
              Strings.insertLogin,
              textEditingController: _tLogin,
              validator: _validateLogin,
              action: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              nextFocus: _focusPassword,
            ),
            SizedBox(
              height: 16,
            ),
            AppInputText(Strings.password, Strings.insertPassword,
                isPassword: true,
                textEditingController: _tPassword,
                validator: _validateLogin,
                keyboardType: TextInputType.number,
                focusNode: _focusPassword),
            SizedBox(
              height: 20,
            ),
            StreamBuilder<bool>(
                stream: bloc.buttonBloc.stream,
                builder: (context, snapshot) {
                  return AppButton(
                    Strings.login,
                    onPressed: () => _onClickLogin(),
                    showProgress: snapshot.data ?? false,
                  );
                }),
          ],
        ),
      ),
    );
  }

  _onClickLogin() async {
    if (!_formKey.currentState.validate()) return;
    String login = _tLogin.text;
    String password = _tPassword.text;

    ApiResponse response = await bloc.login(login, password);

    if (response.ok) {
      User user = response.result;
      print("nome > $user");
      push(context, HomePage(), replace: true);
    } else {
      alert(context, response.message);
    }
  }

  String _validateLogin(String value) {
    if (value.isEmpty) {
      return Strings.insertAText;
    }
    return null;
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }
}
