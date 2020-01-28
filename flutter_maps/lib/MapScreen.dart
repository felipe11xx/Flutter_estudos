import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_maps/city.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  final List<City> cities;

  MapScreen(this.cities);

  @override
  State<MapScreen> createState() => MapState();
}

class MapState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition fiapPosition = CameraPosition(
      target: LatLng(-23.595157, -46.687052), zoom: 19.151926040649414);

  Set<Marker> citiesMarker = Set();

  static const plataform = const MethodChannel("flutter.dev/geolocation");

  @override
  void initState() {
    for (City city in widget.cities) {
      citiesMarker.add(Marker(
          markerId: MarkerId(city.name),
          position: LatLng(city.latitude, city.longitude),
          infoWindow: InfoWindow(title: city.name, snippet: city.state)));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: fiapPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: citiesMarker,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.gps_fixed),
      ),
    );
  }
}
