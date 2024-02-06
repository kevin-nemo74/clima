import 'dart:convert';
import 'package:clima/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart';

import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

const apiKey = 'd3fb918234ae237c05bfd1050cf117a0';

class _LoadingScreenState extends State<LoadingScreen> {
  double? lat;
  double? lon;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    WeatherModel wm1 = WeatherModel();
    var weatherData = await wm1.getLocationData();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LocationScreen(
                  locationWeather: weatherData,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinKitFadingCube(
        color: Colors.white,
        size: 50.0,
      ),
    );
  }
}
