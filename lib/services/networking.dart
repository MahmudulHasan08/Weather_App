import 'dart:convert';
import 'package:weather/screens/loading_screen.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class NetworkingData {
  final String url;
  NetworkingData({required this.url});

  Future getNetworkData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedata = jsonDecode(data);
      return decodedata;
    } else {
      int satauscode = response.statusCode;
      return satauscode;
    }
  }
}

// var cityMainTemp = decodedata['main']['temp'];
// var cityWeatherId = decodedata['weather'][0]['id'];
// var cityName = decodedata['name'];
