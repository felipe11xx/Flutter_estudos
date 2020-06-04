import 'package:aula01/models/fictional_characters.dart';
import 'package:aula01/pages/fictional_character_page.dart';
import 'package:aula01/utils/nav.dart';
import 'package:flutter/material.dart';

class HelloListView extends StatefulWidget {

  @override
  _HelloListViewState createState() => _HelloListViewState();
}

class _HelloListViewState extends State<HelloListView> {
  bool _gridView = true;
  List<FictionalCharacter> ficChars = [
    FictionalCharacter("Gintoki", "assets/images/gintoki.jpg"),
    FictionalCharacter("Jonnhy", "assets/images/jojo.png"),
    FictionalCharacter("Kazuma", "assets/images/little_bomb.png"),
    FictionalCharacter("Nicholas", "assets/images/nicholasDWolf.jpg"),
    FictionalCharacter("Dio", "assets/images/jurassicJojo.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List View"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: () =>
              _onClickList()),
          IconButton(icon: Icon(Icons.grid_on), onPressed: () =>
              _onClickGrid()),
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    if (_gridView) {
      return GridView.builder(
          itemCount: ficChars.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return _itemView(index);
          });
    } else {
      return ListView.builder(
          itemCount: ficChars.length,
          itemExtent: 400,
          itemBuilder: (context, index) {
            return _itemView(index);
          });
    }
  }

 _itemView(int index) {
    FictionalCharacter ficChar = ficChars[index];
    return GestureDetector(
      onTap: () => push(context, FictionalCharacterPage(ficChar)) ,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _image(ficChar.image),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(24)
              ),
              child: Text(
                ficChar.name,
                style: TextStyle(
                    fontSize: 34,
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _image(String image) =>
      Image.asset(
        image,
        fit: BoxFit.cover,
      );

  _onClickGrid() =>
      setState(() {
        _gridView = true;
      });

  _onClickList() =>
    setState(() {
      _gridView = false;
    });

}
