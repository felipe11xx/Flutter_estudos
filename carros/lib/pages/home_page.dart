import 'package:carros/Resources/strings.dart';
import 'package:carros/network/car_api.dart';
import 'package:carros/pages/car/cars_listview.dart';
import 'package:carros/utils/prefs.dart';
import 'package:carros/widgets/app_drawer_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'car/cars_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin<HomePage> {
  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _initTabs();
  }

  _initTabs() async {
    super.initState();
    int index = await Prefs.getInt("tabIndx");

    _tabController = TabController(length: 3, vsync: this);

    setState(() {
      _tabController.index = index;
    });

    _tabController.addListener(
      () {
        Prefs.setInt("tabIndx", _tabController.index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.cars),
        bottom: _tabController == null
            ? null
            : TabBar(
                controller: _tabController,
                tabs: <Widget>[
                  Tab(
                    text: Strings.classic,
                  ),
                  Tab(
                    text: Strings.sport,
                  ),
                  Tab(
                    text: Strings.lux,
                  )
                ],
              ),
      ),
      body: _tabController == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : TabBarView(
              controller: _tabController,
              children: [
                CarsPage(TypeCar.classic),
                CarsPage(TypeCar.sportive),
                CarsPage(TypeCar.lux)
              ],
            ),
      drawer: DrawerList(),
    );
  }
}
