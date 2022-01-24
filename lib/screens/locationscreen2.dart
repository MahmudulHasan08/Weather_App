import 'package:flutter/material.dart';
import 'package:weather/utilities/constants.dart';
import 'package:weather/services/weather.dart';
import 'package:weather/screens/cityscreen.dart';

class LocationScreen2 extends StatefulWidget {
  LocationScreen2({required this.locationweather});
  final locationweather;

  @override
  _LocationScreen2State createState() => _LocationScreen2State();
}

class _LocationScreen2State extends State<LocationScreen2> {
  WeatherModel weather = WeatherModel();
  String? Weathermessage;
  String? weatherIcon;
  String? cityName;
  var temparature;

  @override
  void initState() {
    super.initState();
    updateUi(widget.locationweather);
    print('shetu');
  }

  void updateUi(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temparature = 'Null';
        weatherIcon = 'Error';
        Weathermessage = 'value is not correct for this reason';
        cityName = '';
        return;
      }
      double temp = weatherData['main']['temp'];
      temparature = temp.toInt();
      Weathermessage = weather.getMessage(temparature);
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      cityName = weatherData['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('images/location_background.jpg'),
        fit: BoxFit.cover,
        colorFilter:
            ColorFilter.mode(Colors.white.withOpacity(0.8), BlendMode.dstATop),
      )),
      constraints: BoxConstraints.expand(),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatButton(
                  onPressed: () async {
                    var weatherdata = await weather.getLocation();
                    updateUi(weatherdata);
                  },
                  child: Icon(
                    Icons.near_me,
                    size: 50.0,
                  ),
                ),
                FlatButton(
                  onPressed: () async {
                    var cityName = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CityScreen();
                        },
                      ),
                    );
                    if (cityName != null) {
                      var weatherdata = await weather.getCityweather(cityName);
                      updateUi(weatherdata);
                    }
                  },
                  child: Icon(
                    Icons.location_city,
                    size: 50.0,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  '$temparature°',
                  style: TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Spartan MB',
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  '$weatherIcon',
                  style: TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Spartan MB',
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                '$Weathermessage in $cityName',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Spartan MB',
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
