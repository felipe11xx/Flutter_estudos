import 'package:carros/Resources/strings.dart';
import 'package:carros/domain/user.dart';
import 'package:carros/pages/login/login_page.dart';
import 'package:carros/utils/navigation.dart';
import 'package:flutter/material.dart';

class DrawerList extends StatefulWidget {
  @override
  _DrawerListState createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  @override
  Widget build(BuildContext context) {

  Future<User> future = User.get();

    return Drawer(
        child: ListView(

      children: <Widget>[
        FutureBuilder<User>(
          future: future,
          builder: (context, snapshot){
            User user = snapshot.data;
            return user != null ? _header(user) : Container();
          },


        ),
        ListTile(
            leading: Icon(Icons.star),
            title: Text(Strings.fav),
            subtitle: Text(Strings.moreInfo),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              pop(context);
            }),
        ListTile(
            leading: Icon(Icons.help),
            title: Text(Strings.help),
            subtitle: Text(Strings.moreInfo),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              pop(context);
            }),
        ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text(Strings.logout),
            trailing: Icon(Icons.arrow_forward),
            onTap: () => _onClickLogout(context),
        )
      ],
    ));
  }

  UserAccountsDrawerHeader _header(User user) {
    return UserAccountsDrawerHeader(
        accountName: Text(user.nome),
        accountEmail: Text(user.email),
        currentAccountPicture: CircleAvatar(
          backgroundImage: NetworkImage(user.urlFoto),
        )

      );
  }

  _onClickLogout(BuildContext context) {
    User.clear();
    pop(context);
    push(context, LoginPage(), replace: true);
  }
}
