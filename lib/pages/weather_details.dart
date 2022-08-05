import 'dart:io';

import 'package:flutter/material.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({Key? key, required this.cityName}) : super(key: key);

  final String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text(cityName),),
      body: Center(
        child: Text("Weather details for $cityName"),
      ),
    );
  }
}
