import 'package:carros/Resources/strings.dart';
import 'package:carros/domain/car.dart';
import 'package:carros/pages/car/car_page.dart';
import 'package:carros/utils/navigation.dart';
import 'package:carros/widgets/text_error.dart';
import 'package:flutter/material.dart';

import 'car_bloc.dart';
import 'cars_listview.dart';

class CarsPage extends StatefulWidget {
  String type;

  CarsPage(this.type);

  @override
  _CarsPageViewState createState() => _CarsPageViewState();
}

class _CarsPageViewState extends State<CarsPage>
    with AutomaticKeepAliveClientMixin<CarsPage> {
  List<Car> cars;

  CarBloc bloc = CarBloc();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    bloc.fetch(widget.type);
  }


  @override
  Widget build(BuildContext context) {
    super.build(context);

    print("CarrosListView build ${widget.type}");

    return StreamBuilder(
      stream: bloc.stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return TextError(Strings.carError);
        }
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        List<Car> cars = snapshot.data;

        return CarsListView(cars);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }
}
