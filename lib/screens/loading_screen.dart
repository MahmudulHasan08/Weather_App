import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:weather/screens/locationscreen2.dart';
import 'package:weather/services/weather.dart';
import 'location_screen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'locationscreen2.dart';

const apikey2 = 'abdc2d32abe86cd143650ec6adbcc5cc';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    // WeatherModel weatherModel = WeatherModel();
    var weatherData = await WeatherModel().getLocation();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen2(
            locationweather: weatherData,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
