import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "hello",
        ),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body() => SingleChildScrollView(


      child: Container(
        color: Colors.blue,
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _text(),
            _pageView(),
            _buttons(),
            _text(),
            _pageView(),
            _buttons()],
        ),
      ));

  _pageView() => Container(
        height: 300,
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: PageView(
          children: <Widget>[
            _image("assets/images/jurassicJojo.jpg"),
            _image("assets/images/jojo.png"),
            _image("assets/images/little_bomb.png"),
            _image("assets/images/nicholasDWolf.jpg"),
            _image("assets/images/gintoki.jpg"),
          ],
        ),
      );

  _buttons() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _button("ListView"),
            _button("Page 2"),
            _button("Page 3"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _button("Snack"),
            _button("Dialog"),
            _button("Toast"),
          ],
        )
      ],
    );
  }

  _button(String text) => RaisedButton(
      color: Colors.white,
      child: Text(
        text,
        style: TextStyle(color: Colors.blue, fontSize: 16),
      ),
      onPressed: () => _onClickOk());

  void _onClickOk() => print("Za Warudo");

  _image(String image) => Image.asset(
        image,
      );

  _text() => Text(
        "fala galera",
        style: TextStyle(
          fontSize: 30,
          color: Colors.red,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
          decorationColor: Colors.red,
        ),
      );
}
