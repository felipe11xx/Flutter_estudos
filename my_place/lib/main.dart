import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  List locals = [ "Salt Lake City",
                  "Rome",
                  "Sidney",
                  "London",
                  "São Paulo"];

  List<MaterialColor> colors = [
    Colors.blue,
    Colors.red,
    Colors.amber,
    Colors.cyan,
    Colors.deepPurple
  ];

  String randomText = "";
  MaterialColor randomColor = Colors.green;
  void _atualizarTela() {
    setState(() {

      randomText = locals[new Random().nextInt(locals.length)];
      randomColor = colors[new Random().nextInt(colors.length)];
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(


          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             FlatButton(
               onPressed: _atualizarTela,
               color: randomColor,
               child: Text("Clique"),

             ),

            Text('$randomText',
                style: Theme.of(context).textTheme.display1,
            )
            ],
        ),
      ),

    );
  }
}
