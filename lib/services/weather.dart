import 'package:weather/services/location.dart';
import 'package:weather/services/networking.dart';
import 'package:weather/screens/locationscreen2.dart';

const apikey = 'abdc2d32abe86cd143650ec6adbcc5cc';
const openweathermapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityweather(String cityName) async {
    var url = '$openweathermapUrl?q=$cityName&appid=$apikey&units=metric';
    NetworkingData netdata = NetworkingData(url: url);
    var weatherdata = await netdata.getNetworkData();
    return weatherdata;
  }

  Future<dynamic> getLocation() async {
    Location loc = Location();
    await loc.getCurrentLocation();

    NetworkingData netdata = NetworkingData(
        url:
            // '$openweathermapUrl?lat=${loc.latitude}&lon=${loc.longitude}&appid=$apikey&units=metric');
            '$openweathermapUrl?q=rajshahi&appid=$apikey&units=metric');

    var weatherData = await netdata.getNetworkData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
