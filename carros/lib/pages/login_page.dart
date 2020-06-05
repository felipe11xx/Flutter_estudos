
import 'package:carros/Resources/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  var _tLogin = TextEditingController();
  var _tPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Strings.cars),
        ),
        body: _body());
  }

  _body() => Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            _text(Strings.login, Strings.insertLogin,
                textEditingController: _tLogin),
            SizedBox(
              height: 8,
            ),
            _text(Strings.password, Strings.insertPassword,
                isPassword: true, textEditingController: _tPassword),
            SizedBox(
              height: 20,
            ),
            _button(Strings.login, () => _onClickLogin())
          ],
        ),
      );

  _text(label, hint,
      {isPassword = false, TextEditingController textEditingController}) {
    return TextFormField(
      controller: textEditingController,
      style: TextStyle(color: Colors.blue, fontSize: 25),
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey, fontSize: 25),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.green, fontSize: 16),
      ),
    );
  }

  _button(text, onPressed) {
    return Container(
      height: 46,
      child: RaisedButton(
        color: Colors.blue,
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        onPressed: onPressed,
      ),
    );
  }

   _onClickLogin() {
    String login = _tLogin.text;
    String password = _tPassword.text;
    print("${Strings.login}: $login \n${Strings.password}: $password ");
  }
}
