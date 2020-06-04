import 'package:aula01/drawer_list.dart';
import 'package:aula01/pages/hello_listview.dart';
import 'package:aula01/utils/nav.dart';
import 'package:aula01/widgets/blue_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pages/hello_page2.dart';
import 'pages/hello_page3.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Hello Flutter",
          ),
          centerTitle: true,
          bottom: TabBar(tabs: <Widget>[
            Tab(text:"tab1" ,),
            Tab(text:"tab2" ,),
            Tab(text:"tab3" ,),
          ],),
        ),
        body: TabBarView(children:[
          _body(context),
          Container(color: Colors.red,),
          Container(color: Colors.green,),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _onClickFAB(),
          child: Icon(Icons.add),
        ),
        drawer: DrawerList(),
      ),
    );
  }

  _onClickFAB() {
    print("add");
  }

  _body(context) => Container(
      height: double.infinity,
      color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[_text(), _pageView(), _buttons()],
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
    return Builder(builder: (context) {
      return Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              BlueButton("ListView",
                  onPressed: () => _onClickNavigator(context, HelloListView())),
              BlueButton("Page 2",
                  onPressed: () => _onClickNavigator(context, HelloPage2())),
              BlueButton("Page 3",
                  onPressed: () => _onClickNavigator(context, HelloPage3())),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              BlueButton("Snack", onPressed: () => _onClickSnack(context)),
              BlueButton("Dialog", onPressed: () => _onClickDialog(context)),
              BlueButton("Toast", onPressed: _onClickToast),
            ],
          )
        ],
      );
    });
  }

  _onClickSnack(BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(
        "ola",
      ),
      action: SnackBarAction(
        textColor: Colors.red,
        label: "ok",
        onPressed: () {
          print("ok");
        },
      ),
    ));
  }

  _onClickDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Chora Mais"),
            actions: <Widget>[
              FlatButton(
                child: Text("cancelar"),
                onPressed: () {
                  pop(context);
                },
              ),
              FlatButton(
                child: Text("ok"),
                onPressed: () {
                  pop(context);
                },
              )
            ],
          );
        });
  }

  _onClickToast() {
    Fluttertoast.showToast(
        msg: "TAXADO",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  _onClickNavigator(BuildContext context, Widget page) async {
    String s = await push(context, page);
    print(">> $s");
  }

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


