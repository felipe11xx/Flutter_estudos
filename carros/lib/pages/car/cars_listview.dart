import 'package:carros/Resources/strings.dart';
import 'package:carros/domain/car.dart';
import 'package:carros/pages/car/car_page.dart';
import 'package:carros/utils/navigation.dart';
import 'package:carros/widgets/text_error.dart';
import 'package:flutter/material.dart';

import 'car_bloc.dart';

class CarsListView extends StatefulWidget {
  String type;

  CarsListView(this.type);

  @override
  _CarsListViewState createState() => _CarsListViewState();
}

class _CarsListViewState extends State<CarsListView>
    with AutomaticKeepAliveClientMixin<CarsListView> {
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

        return _listView(cars);
      },
    );
  }

  _listView(List<Car> cars) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
          itemCount: cars != null ? cars.length : 0,
          itemBuilder: (context, index) {
            Car c = cars[index];

            return card(c, context);
          }),
    );
  }

  card(Car c, BuildContext context) {
    return Card(
      color: Colors.grey[200],
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
                child: Image.network(
              c.urlFoto ??
                  "http://www.livroandroid.com.br/livro/carros/esportivos/BMW.png",
              width: 250,
            )),
            Text(
              c.nome ?? "carro",
              style: TextStyle(fontSize: 22),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              c.nome ?? "carro",
              style: TextStyle(fontSize: 16),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            ButtonBarTheme(
              data: ButtonBarTheme.of(context),
              child: ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: Text(Strings.details),
                    onPressed: () {
                      _onClickCar(c);
                    },
                  ),
                  FlatButton(
                    child: Text(Strings.share),
                    onPressed: () {
                      /* ... */
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onClickCar(Car c) {
    push(context, CarPage(c));
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }
}
