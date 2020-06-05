import 'package:carros/Resources/strings.dart';
import 'package:carros/domain/user.dart';
import 'package:carros/network/api_response.dart';
import 'package:carros/network/login_api.dart';
import 'package:carros/utils/navigation.dart';
import 'package:carros/widgets/app_alert.dart';
import 'package:carros/widgets/app_button.dart';
import 'package:carros/widgets/app_inputtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _tLogin = TextEditingController();
  final _tPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _focusPassword = FocusNode();
  bool _showProgress = false;

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
            AppButton(
              Strings.login,
              onPressed: () => _onClickLogin(),
              showProgress: _showProgress,
            ),
          ],
        ),
      ),
    );
  }

  _onClickLogin() async {
    if (!_formKey.currentState.validate()) return;
    String login = _tLogin.text;
    String password = _tPassword.text;

    setState(() {
      _showProgress = true;
    });
    ApiResponse response = await LoginApi.login(login, password);

    if (response.ok) {
      User user = response.result;
      print("nome > $user");
      push(context, HomePage());
      setState(() {
        _showProgress = false;
      });
    } else {
      setState(() {
        _showProgress = false;
      });
      alert(context, response.message);
    }
  }

  String _validateLogin(String value) {
    if (value.isEmpty) {
      return Strings.insertAText;
    }
    return null;
  }
}
