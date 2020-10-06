import 'package:carros/domain/car.dart';
import 'package:carros/resources/strings.dart';
import 'package:carros/widgets/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'loripsum_bloc.dart';

class CarPage extends StatefulWidget {
  Car car;

  CarPage(this.car);

  @override
  _CarPageState createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> {
  final _loripsumBloc = LoripsumBloc();

  @override
  void initState() {
    super.initState();
    _loripsumBloc.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.cars),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.place),
            onPressed: _onClickMap,
          ),
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: _onClickVideo,
          ),
          PopupMenuButton<String>(
            onSelected: (String value) => _onClickPopupMenu(value),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: Strings.edit,
                  child: Text(Strings.edit),
                ),
                PopupMenuItem(
                  value: Strings.delete,
                  child: Text(Strings.delete),
                ),
                PopupMenuItem(
                  value: Strings.share,
                  child: Text(Strings.share),
                ),
              ];
            },
          )
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            Image.network(widget.car.urlFoto),
            _bloc01(),
            Divider(),
            _bloc02(),
          ],
        ));
  }

  Row _bloc01() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            text(widget.car.nome, fontSize: 20, bold: true),
            text(widget.car.tipo),
          ],
        ),
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.favorite,
                size: 40,
                color: Colors.red,
              ),
              onPressed: _onClickFavorite,
            ),
            IconButton(
              icon: Icon(Icons.share),
              onPressed: _onClickShare,
            ),
          ],
        )
      ],
    );
  }

  _bloc02() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        text(widget.car.descricao, bold: true),
        SizedBox(
          height: 20,
        ),
        StreamBuilder<String>(
          stream: _loripsumBloc.stream,

          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(!snapshot.hasData) {
              return Center(child: CircularProgressIndicator(),);
            }
            return text(snapshot.data,fontSize: 16);
          },
        ),
      ],
    );
  }

  void _onClickMap() {}

  void _onClickVideo() {}

  _onClickPopupMenu(String value) {
    switch (value) {
      case Strings.edit:
        print("${Strings.edit}");
        break;
      case Strings.delete:
        print("${Strings.delete}");
        break;
      case Strings.share:
        print("${Strings.share}");
        break;
    }
  }

  void _onClickFavorite() {}

  void _onClickShare() {}

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _loripsumBloc.dispose();
  }
}
