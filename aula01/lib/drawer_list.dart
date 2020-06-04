import 'package:aula01/utils/nav.dart';
import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(

      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text("Felipe"),
          accountEmail: Text("felipe11xx@hotmail.com"),
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage("assets/images/gintoki.jpg"),
          )

        ),
        ListTile(
            leading: Icon(Icons.star),
            title: Text("Favoritos"),
            subtitle: Text("Mais Informações"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              print("teste");
              pop(context);
            }),
        ListTile(
            leading: Icon(Icons.help),
            title: Text("Favoritos"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              print("teste");
              pop(context);
            }),  ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Logout"),
            subtitle: Text("Mais Informações"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              print("teste");
              pop(context);
            })
      ],
    ));
  }
}
